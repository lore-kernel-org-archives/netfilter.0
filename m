From: "Fabiano Reis" <silos.reis@ig.com.br>
Subject: Re: Rounf-Robin NAT
Date: Tue, 16 Mar 2004 10:23:58 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02eb01c40b59$f069d8c0$3f32a8c0@ds.ig.com.br>
References: <WorldClient-F200403161445.AA45470054@exsir.net> <1079438239.2012.1.camel@localhost> <1079464404.7056.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Pawe=B3_Staszewski?= <pstaszewski@artcom.pl>, "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, netfilter@lists.netfilter.org

Arrived a question after seeing this email...

What are the advantages of using this tipe of balance against DNS
RoundRobin?


----- Original Message -----=20
From: "Pawe=B3 Staszewski" <pstaszewski@artcom.pl>
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>;
<netfilter@lists.netfilter.org>
Sent: Tuesday, March 16, 2004 4:13 PM
Subject: Re: Rounf-Robin NAT


> On Tue, 2004-03-16 at 06:57, John A. Sullivan III wrote:
> > On Tue, 2004-03-16 at 06:15, AFShin wrote:
> > > Dear Friends,
> > > Can iptables do the real Round-Robin SNAT --to ?
> > > Is there any patch or it is available ?
> > > Thank you all in advance,
> > > AFShin A.
> > I do not know the actual code but somewhere in the back of my mind I
> > recall something about iptables using a rudimentary load balancing
> > algorithm, i.e., rather than strict round robin, it distributes the next
> > NAT to the least used address.  Can anyone confirm that? - John
>
> Hello
> Try this...
> iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -m nth --counter 4 --every
> 4 --packet 0 -j SNAT --to xxx.xxx.xxx.xx1
> iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -m nth --counter 4 --every
> 4 --packet 1 -j SNAT --to xxx.xxx.xxx.xx2
> iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -m nth --counter 4 --every
> 4 --packet 2 -j SNAT --to xxx.xxx.xxx.xx3
> iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -m nth --counter 4 --every
> 4 --packet 3 -j SNAT --to xxx.xxx.xxx.xx4
>
> that is good round-robin nat, but some services may not work (like https
> or other where is "smart" firewall (anti spoof))
>
>
>
>


