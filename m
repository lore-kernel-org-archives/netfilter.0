From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Preferred way of preserving firewall rules on system reboots?
Date: Thu, 13 May 2004 09:48:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A38ABF.4090907@pbl.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

What is your preferred way of preserving firewall configuration on 
firewall reboots?  I know this is probably distribution specific.

On Red Hat, you can either edit /etc/init.d/iptables or 
/etc/sysconfig/iptables.  The former can be overwritten when upgrading 
iptables package, the later can be overwritten with some temporary 
configuration on system reboots (depending on configuraiton) or when 
somebody calls init.d script with "save" argument by mistake (making it 
"machine generated file", while it should be "administrator generated 
configuration file").

So, the question is, how do you usually do it?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

