From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Forwarding not working, need help
Date: Tue, 15 Nov 2005 14:34:55 +0100 (CET)
Message-ID: <64526.193.173.147.3.1132061695.squirrel@webmail.sterenborg.info>
References: <200511141749.53457.fernando@screenlab.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511141749.53457.fernando@screenlab.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, November 14, 2005 20:49, fernando wrote:

*DONT'T* do this :

> # Setting nat polices to drop:
>
> for TABLES in PREROUTING POSTROUTING OUTPUT
>  	do
>  		$IPTABLES -t nat -P $TABLES DROP
>  	done
>
> # Setting mangle polices to drop:
>
> for TABLES in INPUT PREROUTING POSTROUTING FORWARD OUTPUT
>  	do
>  		$IPTABLES -t mangle -P $TABLES DROP
>  	done

"Filtering" is done in the "filter" table, it is considered "bad
practice" to use other tables and if you're not sure about what you're
doing you may get unexpected results. Please read up on the subject in
the archives.
You must have read /dev/rob0's post that the nat and mangle rules were
a "horrible abuse". I suppose he meant this.

I didn't check the rest of your script. It could be it still doesn't
work if you delete the above, but it may as well.

Personally, I think you had better start with a simple script (this
one contains rules normally not needed in forwarding) and add rules
you think you need when you've got things working.


Gr,
Rob



