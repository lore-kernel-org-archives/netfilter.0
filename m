From: Chris Friesen <cfriesen@nortelnetworks.com>
Subject: Re: firewalling PPPOE stream without terminating it
Date: Mon, 15 Sep 2003 10:55:46 -0400
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <3F65D2F2.7080103@nortelnetworks.com>
References: <3F61D8E4.6020309@nortelnetworks.com> <20030915101826.GH777@obroa-skai.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-admin@mailman.ds9a.nl>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Harald Welte <laforge@gnumonks.org>, netfilter@lists.netfilter.org, lartc@mailman.ds9a.nl

Harald Welte wrote:

For those just joining, I'm trying to put a box between my DSL modem and 
my ethernet switch to enable me to filter up to 5 PPPoE streams.  Harald 
suggested I move the discussion to the proper lists.

> I would like to ask you this question at an apropriate mailinglist
> (netfilter@lists.netfilter.org, or the lartc mailinglist [since the
> assumption that you would need to do NAT in case you terminate the two
> dsl lines is invalid an can be solved using policy routing + connmark]).

Okay, so you're suggesting terminating all the connections on the new 
box and then using policy routing to forward the packets on to the 
appropriate address(es) on the internal side?  And since the PPPoE 
headers have been removed, I could then use standard iptables to do the 
filtering?

Chris





-- 
Chris Friesen                    | MailStop: 043/33/F10
Nortel Networks                  | work: (613) 765-0557
3500 Carling Avenue              | fax:  (613) 765-2986
Nepean, ON K2H 8E9 Canada        | email: cfriesen@nortelnetworks.com

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
