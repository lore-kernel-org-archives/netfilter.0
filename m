From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 09:18:39 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091103519.13650.6.camel@aflores>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de>
	 <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
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
To: david <david@suarapembaruan.co.id>
Cc: netfilter@lists.netfilter.org

	Hello David,

	If you have some firewall rules yet, the rule you mention could never
hit. Use the option -I instead of -A.

	-I will insert your rule at the first position in the chain, unless you
specify the number where you want it.

iptables -I INPUT -i public_interface -s 202.154.10.146/32 -j REJECT

	But, if you're using sendmail, maybe the best to do is to tell sendmail
to reject the traffic from this particular host.
	Go to /etc/mail, edit the file called 'access' and append a line like
this:
202.154.10.146	REJECT "You're sending too much viruses!"
	Then save, type 'make' and restart sendmail.

Regards,
Alejandro Flores


> Dear all,
> 
> My mail server received so many virus mails from ip 202.145.10.147 and after
> i look at gateway (linux) and i using iptraf i see so many traffic from
> 202.145.10.147.
> After that i try to block all traffic from 202.145.10.147 with command :
> #iptables -A INPUT -s 202.145.10.146 -j DROP
> 
> but i still receiveall traffic from 202.145.10.146......
> Can anybody help me ........... that ip send virus in to mail server more
> then 20 mails per minute.......
> 
> 
> Regards,
> David Kandou
> 
> Help me ... iam so confused
> 
> FYI :
> Iam using RedHat 9
> eth0 --> ippublic
> eth1 --> local ip
> mail server --> local ip
> 
> 

