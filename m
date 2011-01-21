From: Arthur Titeica <arthur@psw.ro>
Subject: Re: iptables/ipset syntax
Date: Fri, 21 Jan 2011 10:33:07 +0200
Message-ID: <9285e3784e2e2bb2378c85bab141ee71@psw.ro>
References: <a1bd277586d221277f8a4566fc37355c@psw.ro>
 <alpine.DEB.2.00.1101202314330.2080@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=psw.ro; h=
	user-agent:message-id:references:in-reply-to:organization
	:subject:subject:from:from:date:date:content-transfer-encoding
	:content-type:content-type:mime-version:received:received; s=
	mail; t=1295598798; x=1298190798; bh=q+JrWgsQghwZZTnTgjJVZITU6gf
	2+aGml91x46g/gqk=; b=CTrZII1oY8HqVmv/6l6JP/QykF57py8ZaiK+NObySLo
	GIn4K0UpTqfdWBZaJHby6ZFbIpPiwyNOIYBI1lUH+udjFswJ4KoQ/FA8Jh1ULdb2
	iC9M1GdH2NyOoL1fcYRL5VKM3oX/Qm6njTu58WoJHPg507MVPPL6FP0OoNqbW/fM
	=
In-Reply-To: <alpine.DEB.2.00.1101202314330.2080@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

 On Thu, 20 Jan 2011 23:20:16 +0100 (CET), Jozsef Kadlecsik wrote:
> On Thu, 20 Jan 2011, Arthur Titeica wrote:
>
>> I'm having some trouble understanding the correct syntax for an 
>> iptables rule
>> involving ipset.
>>
>> I need to forward between IPs within the same ipset. So I've tried 
>> using
>> something like this:
>>
>> iptables -A FORWARD -i eth0 -o eth0 -m set --match-set testset 
>> src,dst -p tcp
>> --dport 9000:9020 -j ACCEPT
>
> It'd be good to know the type of "testset". Anyway, if you want to 
> match
> the same IPs in both the source and destination directions by a set, 
> then
> you should use a rule like this
>
> iptables -A FORWARD -i eth0 -o eth0 \
> 	-m set --match-set testset src \
> 	-m set --match-set testset dst \
> 	-p tcp -dport 9000:9020 -j ACCEPT
>
> The keywords "src" and "dst" instructs the set match which parameter 
> to
> grab from the packet ("source IP" or "destination IP") and try to 
> match it
> with the elements in the set. If it's a multidimensional set, then
> multiple "src", "dst" parameters can be used.
>

 Thanks for replying. The ipsets used are hash:ip so no wonder it 
 doesn't work as I thought.
 In my defence the misleading part was the online iptables man [ 
 http://ipset.netfilter.org/iptables.man.html ] which isn't quite clear.


-- 
 Arthur Titeica
 PharmEc Software Constanta
 Mobil: 0729 290 969
 Tel: 0241 616 747
