---
date: 2024-08-10
title: "Gleaming The FinOps Void"
linkTitle: "Gleaming The FinOps Void"
authors: Sacha Wharton & Brendan Walsh
---

<div class="col-center">
<img src="/images/gleaming-the-finops-void.png" alt="gleaming-the-finops-void" height="300px" width="650px" />
</div>
<p></p>

- [The Story](#the-story)
- [BlueArch](#bluearch)
- [Education](#education)
- [Conclusion](#conclusion)

### The Story

A while back, I was contracted to do migrations and conversions of legacy applications into microservices on AWS for a very large financial services company. During this time, there was a lot of learning around how to predict and estimate cost. From an engineer's perspective, there was a gap between what the financial humans expected vs how cloud services ran and how they were billed. One of those challenges was changing the mindset from a CAPEX model to a OPEX model. One of the questions I always got was `How much would it cost?` and the answer I would give was `Well it depends?` which I think might have been rather annoying to hear. The financials wanted a fixed cost to stick in the budget, but since cloud was very much based on your consumption chronologically, it was rather difficult to predict, especially if you had no history. So I started poking around the internet looking for tools to help build a bridge with my financial friends and to take the concern off their shoulders to help predict and budget for more finite figures for Cloud spend.

I did some research, and before I carry on would like to thank all the humans out there who wrote articles and published blogs around this topic. Fast-forwarding a few months, I found many tools to navigate cost and streamline cloud investment. During this discovery process, I came across a few tools such as:

- [BlueArch](https://bluearch.io/)
- [InfraCost](https://www.infracost.io/)
- [Vantage](https://www.vantage.sh/)
- [KubeCost](https://kubecost.com/)
- [OpenCost](https://www.opencost.io/)

### BlueArch

All of them have their merits, but the one I found particularly intriguing was BlueArch. BlueArch is a CLI which integrates into your AWS environment. To give you some background, BlueArch provides a single, intuitive command-line interface for managing multiple AWS accounts and regions. I’ve gone ahead and highlighted a few key points below, as the tool is available for anyone:

- Intelligent EBS Optimization: BlueArch flagged unattached gp2 volumes and upgraded them to gp3 automatically, while simultaneously  identifying underutilized EC2 and RDS instances. It predicts the best IOPS and throughput settings based on historical data, ensuring our storage performance is always top-notch.

- Secure Self-Hosted CLI: Deploys directly within our VPC. This means zero risk of data exfiltration. It plays nice with our existing IAM roles and offers custom encryption for audit logs.

- Comprehensive Misconfiguration Detection: Instead of relying on outdated rule-based checks, BlueArch uses graph-based analysis to spot complex security and cost issues across interconnected resources.

Lets share some real results from running BlueArch in one of our AWS environments:

1. Automated EBS Upgrades + Resource Utilization: BlueArch flagged unattached gp2 volumes and upgraded them to gp3 automatically, while simultaneously identifying underutilized EC2 and RDS instances

2. Custom CloudWatch Alarms: Using BlueArch’s SDK data, we set up tailored CloudWatch alarms. These give us real-time alerts for cost overruns and security risks, such as unused resources hitting a cost threshold or overly permissive security group rules.

3. In-Cluster Configuration Analysis: Employs eBPF-basedloper platform has been a game-changer. It’s a significant step towards a self-optimizing cloud environment, combining automated remediation, secure self-hosting, and advanced reporting. I’ll keep you updated as we continue to evolve our cloud governance strategy.

### Education

The FinOps space is continuously evolving and will become more complex to manage and predict thus we as engineers and financials need tooling and education around this topic. I introduce to you the [FinOps Foundation](https://www.finops.org/) where you can upskill yourself and become a savvy cost aware engineer or a cloud aware savvy financial.

### Conclusion

I hope you think different about cost and let it shape your thinking, infrastructure and software architecture. And at the same time fostering closer more meaningful relationships with our financials.

Happy alien hunting.....

<!-- ### Next Steps

[How to Bake an Ortelius Pi | Part 8 | Architecture So Far](https://ortelius.io/blog/2024/08/10/how-to-bake-an-ortelius-pi-part-4-Cloudflare-Certificates-and-Traefik/) -->

{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Authors</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Sacha Wharton](https://linktr.ee/sachawharton)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/sacha.jpg" alt="Sachawharton" height="400px" width="400px" />
</div>

Learn More About:
- [Bredan Walsh](https://www.linkedin.com/in/brendan-mackin-walsh/)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/brendan-walsh.jpg" alt="Brendan Walsh" height="400px" width="400px" />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}
