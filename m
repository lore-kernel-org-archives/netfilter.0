From: "Julien Didron" <admin@tripnotik.dyndns.org>
Subject: Re: How to log dropped packet ?
Date: Wed, 16 Jul 2003 13:22:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716131925.M66225@tripnotik.dyndns.org>
References: <000701c34b93$c4da9180$96f2f8db@independence.co.kr> <1058359786.6618.33.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1058359786.6618.33.camel@raylinux.internal>
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

Hi all,

I apologize for being a little OT, but has anybody tried to log to another 
file than /var/log/syslog when using -j log ? if so, thanks for sharing the 
experience ;o)

--
Open WebMail Project (http://openwebmail.org)


---------- Original Message -----------
From: Ray Leach <raymondl@knowledgefactory.co.za>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Sent: 16 Jul 2003 14:49:47 +0200
Subject: Re: How to log dropped packet ?

> On Wed, 2003-07-16 at 14:14, Jerry Kim wrote:
> > Hi all.
> > 
> > I hope to know how to log dropped/accepted packets.
> > For example,
> > 
> Exactly the same except put -j LOG --log-prefix "Accept input eth0"
> instead of -j ACCEPT.
> Oh, and the log rule must be before the accept/drop rule.
> 
> > iptables -A INPUT -i eth0 -p tcp -d 10.10.10.1 --dport 22 -j ACCEPT
> > 
> > How can I log it ?
> > I don't understand how '-j LOG' target operate.
> > 
> > Help.
> > 
> -- 
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --
------- End of Original Message -------


