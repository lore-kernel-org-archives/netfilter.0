From: "Leonardo Borda" <borda@netwall.com.br>
Subject: link failover
Date: Thu, 15 May 2003 15:07:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IHEHKFMEMKMGFDMIAHCIKEKIDMAA.borda@netwall.com.br>
Reply-To: <borda@netwall.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello aLL.

	We have two internet access one ADSL connection and another 256Mbps
internet dedicated link.

	We want to configure our firewall (iptables) to choose/detect and determine
when one of that links goes down e automatically reasign another path to the
internet. (like as a link backup).
	I know that I can do it writing a script, but I think its not beautiful...
:)

	I tried to find something on the web but the documents was related to HA
(high availability) which is not my case, I want to have just one firewall
doing the job.

	Glad if you help!

thanks Borda.


---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.481 / Virus Database: 277 - Release Date: 13/5/2003


