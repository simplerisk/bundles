--
-- Table structure for table `audit_log`
--

CREATE TABLE IF NOT EXISTS `audit_log` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `risk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`value`, `name`) VALUES
(1, 'Access Management'),
(2, 'Environmental Resilience'),
(3, 'Monitoring'),
(4, 'Physical Security'),
(5, 'Policy and Procedure'),
(6, 'Sensitive Data Management'),
(7, 'Technical Vulnerability Management'),
(8, 'Third-Party Management');

-- --------------------------------------------------------

--
-- Table structure for table `close_reason`
--

CREATE TABLE IF NOT EXISTS `close_reason` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `close_reason`
--

INSERT INTO `close_reason` (`value`, `name`) VALUES
(1, 'Fully Mitigated'),
(2, 'System Retired'),
(3, 'Cancelled'),
(4, 'Too Insignificant');

-- --------------------------------------------------------

--
-- Table structure for table `closures`
--

CREATE TABLE IF NOT EXISTS `closures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `closure_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `close_reason` int(11) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `CVSS_scoring`
--

CREATE TABLE IF NOT EXISTS `CVSS_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_name` varchar(30) NOT NULL,
  `abrv_metric_name` varchar(3) NOT NULL,
  `metric_value` varchar(30) NOT NULL,
  `abrv_metric_value` varchar(3) NOT NULL,
  `numeric_value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `CVSS_scoring`
--

INSERT INTO `CVSS_scoring` (`id`, `metric_name`, `abrv_metric_name`, `metric_value`, `abrv_metric_value`, `numeric_value`) VALUES
(1, 'AccessComplexity', 'AC', 'High', 'H', 0.35),
(2, 'AccessComplexity', 'AC', 'Medium', 'M', 0.61),
(3, 'AccessComplexity', 'AC', 'Low', 'L', 0.71),
(4, 'AccessVector', 'AV', 'Local', 'L', 0.395),
(5, 'AccessVector', 'AV', 'Adjacent Network', 'A', 0.646),
(6, 'AccessVector', 'AV', 'Network', 'N', 1),
(7, 'Authentication', 'Au', 'None', 'N', 0.704),
(8, 'Authentication', 'Au', 'Single Instance', 'S', 0.56),
(9, 'Authentication', 'Au', 'Multiple Instances', 'M', 0.45),
(10, 'AvailabilityRequirement', 'AR', 'Undefined', 'ND', 1),
(11, 'AvailabilityRequirement', 'AR', 'Low', 'L', 0.5),
(12, 'AvailabilityRequirement', 'AR', 'Medium', 'M', 1),
(13, 'AvailabilityRequirement', 'AR', 'High', 'H', 1.51),
(14, 'AvailImpact', 'A', 'None', 'N', 0),
(15, 'AvailImpact', 'A', 'Partial', 'P', 0.275),
(16, 'AvailImpact', 'A', 'Complete', 'C', 0.66),
(17, 'CollateralDamagePotential', 'CDP', 'Undefined', 'ND', 0),
(18, 'CollateralDamagePotential', 'CDP', 'None', 'N', 0),
(19, 'CollateralDamagePotential', 'CDP', 'Low (light loss)', 'L', 0.1),
(20, 'CollateralDamagePotential', 'CDP', 'Low-Medium', 'LM', 0.3),
(21, 'CollateralDamagePotential', 'CDP', 'Medium-High', 'MH', 0.4),
(22, 'CollateralDamagePotential', 'CDP', 'High', 'H', 0.5),
(23, 'ConfidentialityRequirement', 'CR', 'Undefined', 'ND', 1),
(24, 'ConfidentialityRequirement', 'CR', 'Low', 'L', 0.5),
(25, 'ConfidentialityRequirement', 'CR', 'Medium', 'M', 1),
(26, 'ConfidentialityRequirement', 'CR', 'High', 'H', 1.51),
(27, 'ConfImpact', 'C', 'None', 'N', 0),
(28, 'ConfImpact', 'C', 'Partial', 'P', 0.275),
(29, 'ConfImpact', 'C', 'Complete', 'C', 0.66),
(30, 'Exploitability', 'E', 'Undefined', 'ND', 1),
(31, 'Exploitability', 'E', 'Unproven that exploit exists', 'U', 0.85),
(32, 'Exploitability', 'E', 'Proof of concept code', 'POC', 0.9),
(33, 'Exploitability', 'E', 'Functional exploit exists', 'F', 0.95),
(34, 'Exploitability', 'E', 'Widespread', 'H', 1),
(35, 'IntegImpact', 'I', 'None', 'N', 0),
(36, 'IntegImpact', 'I', 'Partial', 'P', 0.275),
(37, 'IntegImpact', 'I', 'Complete', 'C', 0.66),
(38, 'IntegrityRequirement', 'IR', 'Undefined', 'ND', 1),
(39, 'IntegrityRequirement', 'IR', 'Low', 'L', 0.5),
(40, 'IntegrityRequirement', 'IR', 'Medium', 'M', 1),
(41, 'IntegrityRequirement', 'IR', 'High', 'H', 1.51),
(42, 'RemediationLevel', 'RL', 'Undefined', 'ND', 1),
(43, 'RemediationLevel', 'RL', 'Official fix', 'OF', 0.87),
(44, 'RemediationLevel', 'RL', 'Temporary fix', 'TF', 0.9),
(45, 'RemediationLevel', 'RL', 'Workaround', 'W', 0.95),
(46, 'RemediationLevel', 'RL', 'Unavailable', 'U', 1),
(47, 'ReportConfidence', 'RC', 'Undefined', 'ND', 1),
(48, 'ReportConfidence', 'RC', 'Unconfirmed', 'UC', 0.9),
(49, 'ReportConfidence', 'RC', 'Uncorroborated', 'UR', 0.95),
(50, 'ReportConfidence', 'RC', 'Confirmed', 'C', 1),
(51, 'TargetDistribution', 'TD', 'Undefined', 'ND', 1),
(52, 'TargetDistribution', 'TD', 'None (0%)', 'N', 0),
(53, 'TargetDistribution', 'TD', 'Low (0-25%)', 'L', 0.25),
(54, 'TargetDistribution', 'TD', 'Medium (26-75%)', 'M', 0.75),
(55, 'TargetDistribution', 'TD', 'High (76-100%)', 'H', 1);

-- --------------------------------------------------------

--
-- Table structure for table `impact`
--

CREATE TABLE IF NOT EXISTS `impact` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `impact`
--

INSERT INTO `impact` (`name`, `value`) VALUES
('Insignificant', 1),
('Minor', 2),
('Moderate', 3),
('Major', 4),
('Extreme/Catastrophic', 5);

-- --------------------------------------------------------

--
-- Table structure for table `likelihood`
--

CREATE TABLE IF NOT EXISTS `likelihood` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likelihood`
--

INSERT INTO `likelihood` (`name`, `value`) VALUES
('Remote', 1),
('Unlikely', 2),
('Credible', 3),
('Likely', 4),
('Almost Certain', 5);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`value`, `name`) VALUES
(1, 'Austin, TX');

-- --------------------------------------------------------

--
-- Table structure for table `mgmt_reviews`
--

CREATE TABLE IF NOT EXISTS `mgmt_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `review` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `next_step` int(11) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mitigations`
--

CREATE TABLE IF NOT EXISTS `mitigations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `planning_strategy` int(11) NOT NULL,
  `mitigation_effort` int(11) NOT NULL,
  `current_solution` text NOT NULL,
  `security_requirements` text NOT NULL,
  `security_recommendations` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mitigation_effort`
--

CREATE TABLE IF NOT EXISTS `mitigation_effort` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mitigation_effort`
--

INSERT INTO `mitigation_effort` (`value`, `name`) VALUES
(1, 'Trivial'),
(2, 'Minor'),
(3, 'Considerable'),
(4, 'Significant'),
(5, 'Exceptional');

-- --------------------------------------------------------

--
-- Table structure for table `next_step`
--

CREATE TABLE IF NOT EXISTS `next_step` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `next_step`
--

INSERT INTO `next_step` (`value`, `name`) VALUES
(1, 'Accept Until Next Review'),
(2, 'Consider for Project'),
(3, 'Submit as a Production Issue');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE IF NOT EXISTS `password_reset` (
  `username` varchar(20) NOT NULL,
  `token` varchar(20) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planning_strategy`
--

CREATE TABLE IF NOT EXISTS `planning_strategy` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `planning_strategy`
--

INSERT INTO `planning_strategy` (`value`, `name`) VALUES
(1, 'Research'),
(2, 'Accept'),
(3, 'Mitigate'),
(4, 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '999999',
  PRIMARY KEY (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`value`, `name`, `order`) VALUES
(0, 'Unassigned Risks', 0);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`value`, `name`) VALUES
(1, 'Approve Risk'),
(2, 'Reject Risk');

-- --------------------------------------------------------

--
-- Table structure for table `review_levels`
--

CREATE TABLE IF NOT EXISTS `review_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_levels`
--

INSERT INTO `review_levels` (`value`, `name`) VALUES
(90, 'High'),
(180, 'Medium'),
(360, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `risks`
--

CREATE TABLE IF NOT EXISTS `risks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `reference_id` varchar(20) NOT NULL DEFAULT '',
  `location` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `technology` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `manager` int(11) NOT NULL,
  `assessment` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mitigation_id` int(11) NOT NULL,
  `mgmt_review` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `close_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `risk_levels`
--

CREATE TABLE IF NOT EXISTS `risk_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `risk_levels`
--

INSERT INTO `risk_levels` (`value`, `name`) VALUES
(7, 'High'),
(4, 'Medium'),
(0, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `risk_models`
--

CREATE TABLE IF NOT EXISTS `risk_models` (
  `value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `risk_models`
--

INSERT INTO `risk_models` (`value`, `name`) VALUES
(1, 'Likelihood x Impact + 2(Impact)'),
(2, 'Likelihood x Impact + Impact'),
(3, 'Likelihood x Impact'),
(4, 'Likelihood x Impact + Likelihood'),
(5, 'Likelihood x Impact + 2(Likelihood)');

-- --------------------------------------------------------

--
-- Table structure for table `risk_scoring`
--

CREATE TABLE IF NOT EXISTS `risk_scoring` (
  `id` int(11) NOT NULL,
  `scoring_method` int(11) NOT NULL,
  `calculated_risk` float NOT NULL,
  `CLASSIC_likelihood` float NOT NULL,
  `CLASSIC_impact` float NOT NULL,
  `CVSS_AccessVector` varchar(3) NOT NULL,
  `CVSS_AccessComplexity` varchar(3) NOT NULL,
  `CVSS_Authentication` varchar(3) NOT NULL,
  `CVSS_ConfImpact` varchar(3) NOT NULL,
  `CVSS_IntegImpact` varchar(3) NOT NULL,
  `CVSS_AvailImpact` varchar(3) NOT NULL,
  `CVSS_Exploitability` varchar(3) NOT NULL,
  `CVSS_RemediationLevel` varchar(3) NOT NULL,
  `CVSS_ReportConfidence` varchar(3) NOT NULL,
  `CVSS_CollateralDamagePotential` varchar(3) NOT NULL,
  `CVSS_TargetDistribution` varchar(3) NOT NULL,
  `CVSS_ConfidentialityRequirement` varchar(3) NOT NULL,
  `CVSS_IntegrityRequirement` varchar(3) NOT NULL,
  `CVSS_AvailabilityRequirement` varchar(3) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `name` varchar(20) NOT NULL,
  `value` varchar(12) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('risk_model', '3'),
('db_version', '20130929-001');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`value`, `name`) VALUES
(1, 'Branch Management'),
(2, 'Collaboration'),
(3, 'Data Center & Storage'),
(4, 'Database'),
(5, 'Information Security'),
(6, 'IT Systems Management'),
(7, 'Network'),
(8, 'Unix'),
(9, 'Web Systems'),
(10, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `technology`
--

CREATE TABLE IF NOT EXISTS `technology` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `technology`
--

INSERT INTO `technology` (`value`, `name`) VALUES
(1, 'All'),
(2, 'Anti-Virus'),
(3, 'Backups'),
(4, 'Blackberry'),
(5, 'Citrix'),
(6, 'Datacenter'),
(7, 'Mail Routing'),
(8, 'Live Collaboration'),
(9, 'Messaging'),
(10, 'Mobile'),
(11, 'Network'),
(12, 'Power'),
(13, 'Remote Access'),
(14, 'SAN'),
(15, 'Telecom'),
(16, 'Unix'),
(17, 'VMWare'),
(18, 'Web'),
(19, 'Windows');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL DEFAULT 'simplerisk',
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` binary(60) NOT NULL,
  `last_login` datetime NOT NULL,
  `teams` varchar(200) NOT NULL DEFAULT 'none',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `review_high` tinyint(1) NOT NULL DEFAULT '0',
  `review_medium` tinyint(1) NOT NULL DEFAULT '0',
  `review_low` tinyint(1) NOT NULL DEFAULT '0',
  `submit_risks` tinyint(1) NOT NULL DEFAULT '0',
  `modify_risks` tinyint(1) NOT NULL DEFAULT '0',
  `plan_mitigations` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`value`, `enabled`, `type`, `username`, `name`, `email`, `password`, `last_login`, `teams`, `admin`, `review_high`, `review_medium`, `review_low`, `submit_risks`, `modify_risks`, `plan_mitigations`) VALUES
(1, 1, 'simplerisk', 'admin', 'Admin', 'user@example.com', '$2a$15$21232f297a57a5a743894Oi8eYwNRFyfL7SWQ8schB43FnU2qULWq', '2013-09-29 16:56:03', 'all', 1, 1, 1, 1, 1, 1, 1);
