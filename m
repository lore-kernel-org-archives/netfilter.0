From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: Blocking Netranges Based on IP-to-Country CSV
Date: Mon, 20 Sep 2004 11:10:01 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C9Orn-0006PT-00@deer.gmane.org>
References: <200409201357.i8KDvZNg022820@outbound3.mail.tds.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409201357.i8KDvZNg022820@outbound3.mail.tds.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: nutbrownhares@tds.net, netfilter@lists.netfilter.org

Ok, now, from south america WHERE WE THE INDIANS LIVE, and with this
question understood from the first moment and before all the short minded
discussion.

The approach for this technical issue ill do is a script to insert those
rules. Off course there could be a lot of other approaches but.

If my csv is something like this

CountryA,a.b.c.d/16
countryA,z.x.d.e/12

Ill do something like

---cut here


#!/usr/bin/perl -w

open FILE,"<file.csv";

while(<FILE>)
{
@a=split(",",$_);
System("iptables -A CHAIN -s $a[0] -j DROP");
}
Close FILE;

---cut here

But, i think that you can choose the method based on these directive

"if theres more banned addresses of permited" < set policy to drop and add
the allowed ones with a script like the posted one.
"if theres more allowed addresses of banned" < to set policy to accept is
not a good idea, at least you may add a drop at the bottom of the chain and
use the script provided.

Off course there could be other approaches, but i hope it helps.

Regards


 

-----Mensaje original-----
De: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] En nombre de
nutbrownhares@tds.net
Enviado el: Lunes, 20 de Septiembre de 2004 10:58
Para: netfilter@lists.netfilter.org
Asunto: Blocking Netranges Based on IP-to-Country CSV

With all due respect, I initially asked a technical question: given a data
file, how does one block ranges from that file.  I didn't ask if people
agreed or disagreed with why we want to do this.   The "why" isn't relevant
to the discussion.  I'm also not interested in whether it is or is not 100%
effective; I know it isn't.  It will still eliminate 95% of the traffic I
want to stop.  So far I've seen a lot of political opinions.  Does anyone
have a technical answer?






