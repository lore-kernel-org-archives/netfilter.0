From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: More H.323 questions
Date: Thu, 4 Sep 2003 11:50:55 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019314@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Ramin, chill out. It was off the top of my head and I remembered there =
were 2 modules that needed loading.
The user only needs to check his docs for this and confirm he has 2 =
modules loaded if they were compiled as modules.

I've answered this exactly the same way once before and even then a user =
replied to me personally and said "I only had one loaded" whether or not =
the spelling of the module name was correct or not.. the point was more =
that there needs to be 2 modules for it to work..

Hence, I've connected home to my H323 machine just to confirm my finding =
and I was right...

        /sbin/insmod ip_conntrack_h323 >/dev/null 2>&1
        /sbin/insmod ip_nat_h323 >/dev/null 2>&1

And for the archives, I've added my rules.. Now lets see how many vague =
questions we're going to get asking the exact same problem/request to =
get working...

       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 389    =
-j DNAT --to 192.168.1.1        # H323
       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 522    =
-j DNAT --to 192.168.1.1        # H323
       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1503   =
-j DNAT --to 192.168.1.1        # H323
       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1720   =
-j DNAT --to 192.168.1.1        # H323
       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1731   =
-j DNAT --to 192.168.1.1        # H323
       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 8080   =
-j DNAT --to 192.168.1.1        # H323
       $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1469   =
-j DNAT --to 192.168.1.1        # H323audio?

-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
Sent: Thursday, September 04, 2003 11:13 AM
To: George Vieira
Cc: Mark Goldberg; netfilter@lists.netfilter.org
Subject: Re: More H.323 questions


On Thu, Sep 04, 2003 at 08:44:29AM +1000, George Vieira wrote:

> You need:
>=20
> insmod ip_conntrack_h323
> insmod ip_nat_h323
>=20
> or something like that... I have it and it works..

If you have it and it works then we expect to not hear "or something =
like that"
but a more specific answer...

Ramin

>=20
> Thanks,

