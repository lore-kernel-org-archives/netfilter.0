From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: printk mac address --hangs
Date: Thu, 13 May 2010 22:37:40 +0530
Message-ID: <AANLkTinnqyBwCYQB1rLWI04VBr28DRludbfO9cFcTgAo@mail.gmail.com>
References: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>
	 <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=sBeaVezgr0M+szIKr680KDWpVDkbKuukwWjSZjIwcPE=;
        b=Hom6RI5kHqjA5sdJCZKboWsFFVWOCWNZO5J9LjJd9A6jv7JsrmB1Ohlwag1dwAtL/S
         6N06Nf2cDTo++9WQIomJggDed6CNeA/w9hce/dh2wVMdYXbihO7MJfVM2lE6J+al1Bui
         9wImpnG6dcgRmvCHqfw2FjXXQMoDgf1jlqHfU=
In-Reply-To: <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thu, May 13, 2010 at 9:49 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> If you do not have an Ethernet packet, this is going to explode.

I have only one  ethernet network interface (eth0 ) with 192.168.1.5 .
I could see in wireshark all  packets with ethernet mac addresses .
When i try to prink the mac address or copy ,  it hangs ..

-Ratheesh


On Thu, May 13, 2010 at 9:49 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>h
> On Thursday 2010-05-13 17:45, ratheesh k wrote:
>
>>Why this program cause kernel crash ? , If i comment out "memcpy " ,
>>it works fine
>>
>>/* This is the hook function itself */
>>unsigned int hook_func(unsigned int hooknum,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct sk_buff *skb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct net_device =
*in,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct net_device =
*out,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*okfn)(struct sk_bu=
ff *))
>>{
>> =A0 =A0struct iphdr* ip_header;
>> =A0 =A0struct tcphdr* tcp_header;
>> =A0 =A0struct ethhdr * eth_header ;
>> =A0 =A0char src[ETH_ALEN+2];
>> =A0 =A0char dst[ETH_ALEN+2];
>> =A0 =A0 =A0src[ETH_ALEN+1]=3D'\0';
>> =A0 =A0 =A0dst[ETH_ALEN+1]=3D'\0' ;
>>
>> =A0 =A0 ip_header =A0=3D ip_hdr(skb);
>> =A0 =A0tcp_header =3D tcp_hdr(skb);
>> =A0 =A0eth_header =3D eth_hdr(skb);
>>
>>
>> =A0 =A0 =A0memcpy(src , eth_header->h_source , ETH_ALEN );
>> =A0 =A0 =A0memcpy(dst , eth_header->h_dest , ETH_ALEN );
>
> If you do not have an Ethernet packet, this is going to explode.
>
>
>>
>> =A0 =A0return NF_ACCEPT; =A0 =A0 =A0 =A0 =A0 /* Drop ALL packets */
>>}
>>
>>/* Initialisation routine */
>>int init_module()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^ void
>
>>{
>> =A0 =A0/* Fill in our hook structure */
>> =A0 =A0nfho.hook =3D hook_func; =A0 =A0 =A0 =A0 /* Handler function =
*/
>>
>> =A0 =A0nfho.hooknum =A0=3D NF_IP_LOCAL_OUT; /* First hook for IPv4 *=
/
>>
>> =A0 =A0nfho.pf =A0 =A0 =A0 =3D PF_INET;
>>
>> =A0 =A0nfho.priority =3D NF_IP_PRI_FIRST; =A0 /* Make our function f=
irst */
>>
>> =A0 =A0nf_register_hook(&nfho);
>>
>> =A0 =A0return 0;
>>}
>>
>>/* Cleanup routine */
>>void cleanup_module()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^ void
>
>>{
>> =A0 =A0nf_unregister_hook(&nfho);
>
