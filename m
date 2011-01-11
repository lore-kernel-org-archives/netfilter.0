From: Roc Bai <buroc83@gmail.com>
Subject: Re: How to redirect the package from eth0 to eth2
Date: Tue, 11 Jan 2011 11:22:20 +0800
Message-ID: <AANLkTiniEo+DvnWfZQDU3FBZ7iAoqTnqAYuE1QbR=Wt2@mail.gmail.com>
References: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj@mail.gmail.com>
	<20110110115615.GH25060@outback.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=F6ps+HVBjjzDzi25emfbJ9QEpCCxW2kW2dDRSWOHqxc=;
        b=muM4aWPaKugBtq4LGkEDMBLV4cHVMEQdGTg8E1CXUV/nNYg4BTPXSEX2pewJRSQ4+U
         +cd11C3FpzB0vuEsOJqqVQ08isjeywkr6JSIkjNHZssaYt8B7lkSbCBjNeemaJYNYn5q
         TiEzT1LX6bwy0atRKXVP1rtSsSuXy2DXW6jN8=
In-Reply-To: <20110110115615.GH25060@outback.rfc2324.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2011/1/10 Maximilian Wilhelm <max@rfc2324.org>:
> Anno domini 2011 Roc Bai scripsit:
>
> Hi!
>
>> Dear all:
>> =A0 =A0 in my service, there are four net card. =A0eth0, eth1, eth2,=
 eth3. I
>> want to forward the data in from eth0 to eth1, eth2, eth3 with
>> different application protocol. Does some body send me some ideas on
>> it?
>
> So you want to route (as in IP routing) packages to different hosts
> based on protocols (as in IP, GRE, etc?) or tcp/udp ports? Is this
> correct?
>
>> =A0 =A01) where i should set the hook: pre-routing or forward?
>> =A0 =A02) how to make the route select the target port which i hope?
>

> If you want to re-route packages, that has to happen in pre-routing.
> If you want to use DNAT for examples, just add a rule to the
> PREROUTING chain in the nat table.
I think the DNAT should change the package data, including the IP or
higher level protocol header, isn't it?
> If you want to use real routing, there should be multiple ways to
> accomplish that. I'm not sure which one is the preferred now adays.
> (mark packages and us 'ip rule' and multiple routing tables, ROUTE
> target, ...)
I think the best idea which can redirect the package is to add/change
the route rule to do it. I have write some source codes which doesn't
work.

I add the bellow line in ip_route_input_common() function, which will
call ncf_get_entry().
int ip_route_input_common(struct sk_buff *skb, __be32 daddr, __be32 sad=
dr,
                           u8 tos, struct net_device *dev, bool noref)
{
        struct rtable * rth;
        unsigned        hash;
        int iif =3D dev->ifindex;
        struct net *net;
        struct dst_entry *entry;
        int count =3D 0;

        if ((strncmp(dev->name, "eth0", 4) =3D=3D 0) && (entry =3D
ncf_get_entry(skb, daddr, saddr, tos, dev)) !=3D NULL) {
                if (noref) {
                        dst_use_noref(entry, jiffies);
                        skb_dst_set_noref(skb, entry);

                } else {
                        dst_use(entry, jiffies);
                        skb_dst_set(skb, entry);
                }

                //ip_local_out(skb);
                return 0;
        }

       ....
}


ncf_get_entry() can generate a dst_entry whose dev point to the eth2
net_device structure. But when i use tcpdum -i eth2. I cannot get the
package from eth0. So it doesn't work.

static struct dst_entry gdst;
static int ncfflag =3D 0;
static struct dst_entry *ncf_get_entry(struct sk_buff *skb,
        __be32 daddr, __be32 saddr, u8 tos, struct net_device *dev)
{
        struct net_device *out_dev =3D dev_get_by_name(&init_net, "eth2=
");

        if (out_dev =3D=3D NULL) {
                return NULL;
        }
        /* Init the gdst dst_entry */
        if (ncfflag =3D=3D 0) {
                memset(&gdst, 0, sizeof(gdst));

                gdst.ops =3D &ipv4_dst_ops;
                gdst.lastuse =3D jiffies;
                gdst.path =3D &gdst;
                atomic_inc(&ipv4_dst_ops.entries);

                atomic_set(&gdst.__refcnt, 1);

                gdst.flags =3D DST_HOST;
                gdst.flags |=3D DST_NOPOLICY;
                gdst.flags |=3D DST_NOXFRM;
                gdst.dev  =3D out_dev;
                dev_hold(gdst.dev);

                gdst.obsolete =3D -1;
                gdst.input =3D ip_forward;
                gdst.output =3D ip_output;
                ncfflag =3D 1;
        } else {
                /* I don't know whether they are correct */
                atomic_set(&gdst.__refcnt, 1);
                dev_hold(gdst.dev);
        }

        return &gdst;
}

I hope somebody can fix the issues on the above source code. Thanks!

>
>> =A0 =A03) where i can get some simple source code to learn?
I want to find some sample code to modify the skb, which can redirect
the skb from one port to another port.
>
> Source code of what?
>
> Maybe you can say a bit more about what you exactly want to do?
>
> Ciao
> Max
> --
> The real problem with C++ for kernel modules is:
> the language just sucks.
> -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
------------------------

Thinking before action, but you are wasting time if you don't do action=
=2E
