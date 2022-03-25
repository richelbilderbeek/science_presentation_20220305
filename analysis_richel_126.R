datadir_without_slash <- "~/GitHubs/nsphs_ml_qt/issues/richel_issue_126/home/richel/sim_data_2_richel_issue_126"
datadir <- paste0(datadir_without_slash, "/")
gcaer::check_datadir(datadir)
testthat::expect_true(dir.exists(datadir))
trainedmodeldir <- paste0(datadir_without_slash, "_ae/")
testthat::expect_true(dir.exists(trainedmodeldir))
gcaer::check_trainedmodeldir(trainedmodeldir)

basename <- paste0(datadir, "sim_data_2_richel_issue_126")
bed_filename <- paste0(basename, ".bed")
bim_filename <- paste0(basename, ".bim")
fam_filename <- paste0(basename, ".fam")
phe_filename <- paste0(basename, ".phe")

testthat::expect_true(file.exists(bed_filename))
testthat::expect_true(file.exists(bim_filename))
testthat::expect_true(file.exists(fam_filename))
testthat::expect_true(file.exists(phe_filename))

phe_table <- plinkr::read_plink_phe_file(phe_filename = phe_filename)
knitr::kable(plinkr::read_plink_bed_file_from_files(bed_filename = bed_filename, bim_filename = bim_filename, fam_filename = fam_filename)[ , 1:5])
knitr::kable(plinkr::read_plink_bim_file(bim_filename = bim_filename))
knitr::kable(head(plinkr::read_plink_fam_file(fam_filename = fam_filename), n = 5))
knitr::kable(head(phe_table, n = 5))

assoc_qt_result <- plinkr::assoc_qt(
  assoc_qt_data = plinkr::create_assoc_qt_data(
    data = plinkr::create_plink_bin_filenames(
      bed_filename = bed_filename,
      bim_filename = bim_filename,
      fam_filename = fam_filename
    ),
    phenotype_data = plinkr::create_phenotype_data_table(phe_table = phe_table)
  )
)
qassoc_filename <- assoc_qt_result$qassoc_filenames
qassoc_table <- plinkr::read_plink_qassoc_file(qassoc_filename = qassoc_filename)
knitr::kable(qassoc_table)


png_filename <- "~/analysis_richel_126.png"
csv_filename_for_nmse <- "~/analysis_richel_126_nmse.csv"

p <- gcaer::analyse_qt_prediction(
  datadir = datadir,
  trainedmodeldir = trainedmodeldir,
  png_filename = png_filename,
  csv_filename_for_nmse = csv_filename_for_nmse
)
p <- p + bbbq::get_bbbq_theme()
p
ggplot2::ggsave(filename = png_filename, width = 7, height = 7)

#######################
#
# Expected plot
#
#######################
t <- tibble::tibble(
  true_phenotype = rep(seq(pi, 3 * pi, by = pi), times = 10),
  predicted_phenotype = rep(seq(pi, 3 * pi, by = pi), times = 10)
)

p <- ggplot2::ggplot(t, ggplot2::aes(x = true_phenotype, y = predicted_phenotype)) +
  ggplot2::geom_jitter(width = 0, height = pi / 5, alpha = 0.5) +
  bbbq::get_bbbq_theme() +
  ggplot2::scale_x_continuous(limits = c(0 * pi, 4 * pi)) +
  ggplot2::scale_y_continuous(limits = c(0 * pi, 5 * pi)) +
  ggplot2::geom_abline(slope = 1, intercept = 0, lty = "dashed")
p
ggplot2::ggsave(
  filename = "~/analysis_richel_126_expected.png",
  width = 7, height = 7
)

#######################
#
# Training
#
#######################
t_f <- tibble::tibble(
  t = seq(0, 1000),
  score_type = "dimensionality reduction",
  score = 1 - exp(-0.01 * seq(0, 1000))
)
t_p <- t_f
t_p$score_type = "trait prediction"
t_p$score <- 1 - (2 * exp(-0.003 * seq(0, 1000)))
t_p$score[t_p$score < 0] <- 0
t <- dplyr::bind_rows(t_f, t_p)

p <- ggplot2::ggplot(t, ggplot2::aes(x = t, y = score, color = score_type)) +
  ggplot2::geom_point() +
  bbbq::get_bbbq_theme() +
  ggplot2::theme(legend.position = "bottom") +
  ggplot2::guides(color = ggplot2::guide_legend(nrow = 2, byrow = TRUE))
p
ggplot2::ggsave(
  filename = "~/training_piggyback.png",
  width = 7, height = 7
)
