From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I submit you my rules, to have your opinions.
Date: Fri, 12 Mar 2004 14:42:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403121442.41195.Antony@Soft-Solutions.co.uk>
References: <4051AEC2.30100@wanadoo.fr> <200403121252.40589.Antony@Soft-Solutions.co.uk> <4051C64E.7050605@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4051C64E.7050605@wanadoo.fr>
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

On Friday 12 March 2004 2:16 pm, Rakotomandimby Mihamina wrote:

> Antony Stone wrote:
> >>I made several searches over the internet to build my firewall rules.
> >>Here they are :
> >>http://stko.dyndns.info/scripts/ipt
> >
> > I really think you should restrict the rules:
>
> I did as you say , but i dont kow the destination and/or source port of
> the answer from the DNS .

DNS servers respond from source port 53.   This is the same as all protocols - 
the response comes back from the same source port that you send the request 
to as a destination port - ie: HTTP responses come from source port 80; SMTP 
responses come from source port 25, etc.

> OR is it just a "related to established" so that i dont have to care
> about the answer ?

If all you want is to allow replies from your ISP's DNS servers in response to 
queries you sent out, then yes, those replies will be covered by the 
ESTABLISHED rule.

If you are running authoritative DNS for a zone and you need to allow external 
queries to your server then you need to allow NEW packets in to TCP & UDP 
destination ports 53 (however I do not think this is what you are doing).

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


