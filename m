From: Payal <payal@hotpop.com>
Subject: Re: masquerading and access
Date: Wed, 30 Oct 2002 23:12:35 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030174234.GA5585@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
Thanks a lot for the mails. Well, my requirement is simple. I have one
Linux box (connected to net) and say 50 Windows clients. On the Linux box I will put squid,
qmail, dnscache. Now out of these 50 email clients only some i.e
192.168.0.1-192.168.0.25 need to use net directly i.e. browse sites and
ftp outside & use SMTP. The rest just need to use the SMTP for email.
Please do not have a picture of a complex setup in mind.

In short,
192.168.0.1-192.168.0.25 --> www, ftp and smtp(which is on say 192.168.0.1)
192.168.0.26-192.168.0.50 --> just use SMTP on 192.168.0.1 to send mails
outside, but no strict other internet access.

Now what rules should I put? I want to use squid as http proxy.
I am still unable to get how you figure what 192.168.0.0/27 thing. I can
get some help here for this specific problem, but it might cause a
problem if I were to increase/decrease the above ip range a bit. So,
please tell me how to calculate this.

Please also do tell the rules I have to put for masquerading (I need it
for ftp atleast, right?)

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
This is the box which runs squid and is connected to internet.
Any help here please? I think this rule will masquerade for all
machines, then I have to use DROP/REJECT for machines 192.168.0.26
onwards. Is there any better and less clumsy way?

Thanks a lot and bye.
With regards.
-Payal

