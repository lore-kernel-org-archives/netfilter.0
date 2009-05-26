From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: tc and priority
Date: Tue, 26 May 2009 10:10:18 +0300
Message-ID: <38db14850905260010w7cfd2259q8fb291b36aec55f6@mail.gmail.com>
References: <4A142FF7.1050700@duet.it>
	 <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>
	 <4A15572D.3000303@duet.it>
	 <38db14850905210722k7818822en4d9ceb072ad1c6b6@mail.gmail.com>
	 <4A156620.6050904@duet.it>
	 <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>
	 <4A16937B.8020405@duet.it>
	 <38db14850905221105l3e940df8y5eae3688f5a9028d@mail.gmail.com>
	 <4A1A87C9.9030007@duet.it> <4A1AB178.2010107@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=YjUhqDQVEqLi2GX4dmUKYfa1Yj9+qw67ZS1QTjb3HmM=;
        b=CKfnHGXz4fPmpu6A0YCzwrWm73DRN/totifgsNdX7L0JSh0Ga9z2wa7oLwzkO5P05i
         X1TkX1eSRzlMhJsS81Aya6qFwfrf/TeX+aA9h8AFejNW7ssEnjtDqD9ZzCyRMZAOMlZj
         AMTaPwbuw18LQpa0Mhswn26GiaZB1MZ3KIERc=
In-Reply-To: <4A1AB178.2010107@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

Hi,

Check out:
 tc -s filter show dev eth0.

Where do you using prio qdisc in your testing scheme
( client --- INTERNET--- router --- shaper1 --- server )?

As a hint - prio qdisc sends packets at WIRE speed, if you need to
shape speed you should use tbf or htb/hfsc qdiscs in leaf classes(
1:1,1:2,1:3 )


2009/5/25, Fabio Marcone <fabio.marcone@duet.it>:
> Hi,
> I test this script:
> #!/bin/bash
>
> tc qdisc del dev eth0 root
> iptables -P INPUT ACCEPT
>
> tc qdisc add dev eth0 root handle 1: prio bands 3
> tc qdisc add dev eth0 parent 1:1 handle 2 sfq perturb 10
> tc qdisc add dev eth0 parent 1:2 handle 3 sfq perturb 10
> tc qdisc add dev eth0 parent 1:3 handle 4 sfq perturb 10
> #tc filter add dev eth0 protocol ip parent 1: prio 1 u32 match ip sport 80
> 0xffff flowid 1:1
> ##tc filter add dev eth0 protocol ip parent 1: prio 2 <your criteria_middle>
> flowid 1:2
> #tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match ip sport 81
> 0xffff flowid 1:3
> tc filter add dev eth0 protocol ip parent 1: prio 1 u32 classid 1:1 match ip
> protocol 6 0xFF match ip sport 80 0xFFFF
> tc filter add dev eth0 protocol ip parent 1: prio 2 u32 classid 1:3 match ip
> protocol 6 0xFF match ip sport 81 0xFFFF
> tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match u8 0 0 flowid
> 1:2
>
>
> I run 4 high priority processes (classid 1:1) and 1 low priority one
> (classid 1:3).  These are the result:
> high proc1: 19.5K/s
> high proc2: 5.71K/s
> high proc3: 738B/s
> high proc4: 12.8K/s
>
> low proc: 5.8 K/s
>
> I don't undestand: low process didn't stall and a high process used a
> datarate << than low process.
>
>
> Help, help, help!
>
>
> Fabio


-- 
Best regards
Anatoly Muliarski
