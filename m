From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What is best protection for RDBMS backend of web-server in DMZ
Date: Sun, 22 Aug 2004 17:54:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408221754.21495.Antony@Soft-Solutions.co.uk>
References: <1093189392.16081.24.camel@Sewak.Asr.Lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093189392.16081.24.camel@Sewak.Asr.Lan>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Sunday 22 August 2004 4:43 pm, Sanjay Arora wrote:

> Hi all
>
> What are the issues involved in securing a RDBMS that is serving a
> web-server in DMZ. RDBMS is postgreSQL, OS is Linux, Webserver is Apache.

Your main challenge is to avoid SQL-injection attacks from user-supplied 
input.

This cannot be prevented with firewalls - it requires careful coding and 
validation of input in the scripts which join Apache to PostgreSQL.

I would say that a firewall between the Apache and the PostgreSQL machines, or 
a firewall in front of a combined machine, is essential, and should provide 
HTTP access only, but is actually only a small part of the security solution 
in a case such as this.

> Should I bifurcate the DB and put the registration part in DMZ or should I
> put a copy of the registration part in DMZ and sync it periodically with the
> main DB. Or should I keep full DB on the Green Network & create a pinhole to
> access the RDBMS from the Green subnet, maybe in some kind of ssh tunnel. 

I would put the DB in the DMZ and provide selective access to it from inside + 
outside - that's what a DMZ is for.   Never put a public-access machine on 
the internal network, and don't split an application with some sort of data 
sync going on unless you *really* have to.

Regards,

Antony.

-- 
Some mistakes are too much fun to make only once.

                                                     Please reply to the list;
                                                           please don't CC me.


