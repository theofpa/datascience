Checklist
=========

DO:

* Make sure you have a question, a goal. (Coherent, focused question.)
* Choose good collaborators, good working relationships.
* Teach the computer with instructions on how to do it.
* Download and extract the file from the code.
* Use version control. Small chunks, not massive commits.
* Keep track what is happening.
* Tag snapshots, revert to old versions.
* Keep track of the software environment:
  * Computer architecture
  * OS (ex. sessionInfo())
  * Software toolchain (compilers, languages, databases)
  * Supporting software, infrastructure (libraries, packages).
  * External dependencies (data repositories, remote databases)
  * Version numbers.
* Use set.seed() to initialize the random number generators.
* Think the entire pipeline.

DON'T:

* Do things by hand. (excel, cleanup, validation)
* Change rounding in tables, figures.
* Download data from websites (manually from the browser)
* Moving data around, split, format.
* Use GUIs (and actions taken by point and click).
* Save output (tables, figures), use the code to generate output instead.

How far back in the analysis pipeline can we go?

Evidence-based Data Analysis
============================

Replication:

* Is a scientific claim valid?
* Is the claim true?

Reproducibility

* Validation of data analysis
* Can we trust this analysis?

Some studies cannot be replicated (money, time)

What we get:

* Transparency
* Data availability
* Software/methods availability
* Improved transfer of knowledge

What we don't get:

* Validity of the analysis.

Problems with reproducibility

* Assumes everyone plays by the same rules and wants to achive the same goals.

Who reproduces research? What are their goals?

* Original investigator
* Reproducers
  * I don't care (General public)
* Scientists

Brings transparency, transfer of knowledge
* How to get people to share data.
* Can we trust the analysis?

Evidence-based data analysis:

* Create analytic pipelines, standardise it
* Analysis with a 'transparent box'
* Deterministic Statistical Machine (DSM)

One DSM is not enough, we need many!
