From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 09:15:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4109066F.50300@pbl.ca>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de>	 <001601c47565$8e0ba110$858310ac@suarapembaruan.com> <1091103519.13650.6.camel@aflores>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091103519.13650.6.camel@aflores>
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
To: netfilter@lists.netfilter.org

Alejandro Flores wrote:
> 	But, if you're using sendmail, maybe the best to do is to tell sendmail
> to reject the traffic from this particular host.
> 	Go to /etc/mail, edit the file called 'access' and append a line like
> this:
> 202.154.10.146	REJECT "You're sending too much viruses!"
> 	Then save, type 'make' and restart sendmail.

Access.db is a map.  You don't need to restart sendmail after you update 
/etc/mail/access file and rebuild access.db map (either using supplied 
Makefile if present, or by running "makemap hash access.db < access", I 
prefer later over former).  Same for all other maps.  You only need to 
restart sendmail when sendmail.cf is changed, and any of the files 
referenced by F lines in sendmail.cf (those are read once at startup).

Although solution with sendmail is cleaner and more polite (the offender 
gets the error why he/she is refused, and you are blocking only email), 
I don't think that somebody who is not noticing that he/she is spitting 
out viruses in such a high rate is going to notice and/or care about it.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

