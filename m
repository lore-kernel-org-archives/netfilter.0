From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: How to install patch-o-matic
Date: Wed, 18 Aug 2004 11:34:16 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BxSJZ-0007T5-HH@vishnu.netfilter.org>
Reply-To: <bassam@palettemm.com>
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

Hi All,
   I am new to Linux, I have been asked to enable multiple VPN clients
(PPTP) on the LAN side to pass through the Linux Red Hat 9.0 box and get
connected to the VPN server on the WAN side at the same time.

--------------	--------------				--------------
|VPN-Client-1|	|VPN-Client-2|	.............	|VPN-Client-n|
--------------	--------------				--------------
	|			|
|
	|			|
|
	-------------------------------------------------------
				|
				|
				| LAN Side
				|
				|
			-------------------
			|Red Hat 9.0 Box	|
			-------------------
				|
				|
				| WAN side
				|
				|
			------------
			|VPN Server|
			------------

During my research on the net, I found that I need to load two modules in
the kernel in order to enable this function; the modules (please correct me
if I am mistaken) are "ip_conntrack_pptp" & "ip_nat_pptp".

And I found that these two modules come with patch "patch-o-matic". I have
kernel version "2.4.20-8" and iptables version "v1.2.7a", and hence I
downloaded the "patch-o-matic-20030107.tar.bz2" in accordance.

I decompressed and untar that patch inside "/root" directory.
Then I get inside the directory "/root/patch-o-matic-20030107" and I found a
list of files and other directories.
In fact I don't know how to complete the installation process after that and
which file I should start with in order to have these two modules in hand;
it is not mentioned precisely in the README file.


It is required to recompile and build the Red Hat 9.0 kernel after
installation that patch, so can you refer me where can I find a detailed
instructions and steps on how to compile the kernel?

Please describe for me in details.

I highly appreciate your cooperation about this matter


Regards
Bassam

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.740 / Virus Database: 494 - Release Date: 8/16/2004
 


