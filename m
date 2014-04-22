From: "Anton 'EvilMan' Danilov" <littlesmilingcloud@gmail.com>
Subject: Re: how to ignore forwarded traffic?
Date: Tue, 22 Apr 2014 10:45:56 +0400
Message-ID: <CAEzD07+qebpkE1LxTETBxKHLvhYf9N08d0YJLVz7M5_Se_EKNg@mail.gmail.com>
References: <lj1rka$f3l$1@ger.gmane.org>
	<CAEzD07Kz6bh16_YFTv-sgO0ZoXAneOwUUQt7=Kg6fy2b8LCY7w@mail.gmail.com>
	<535531A6.6090602@gmail.com>
	<53553D20.5040401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=TmVrQ40FL96oUbqBM13MDnT/HOTnon7Toevyy/V0ID8=;
        b=zOSbtnaN7PaDnChFgzk7v62F4hFsVh4A0wmDhaEx+BWgkXafnQPWQujakDJlYs/VP6
         dkqcNdPenegFstUGnfcA27L1mj8S18BE8S3e33BcwwZT2103+AHOyICKS27ZFWlJmzBx
         5kTaD8IZZglSUJ+AlmiLSuB7naRT8kYh62dZ99XW1X7TEQjeSA2p6b7ansdz5BHVkhPV
         zL15Gx5jE2kQ5mUVoyLc+3r/6Qg9drudqf5zF1uJMYprZ1Q0Ek1Q39EFPch/HIxU9p9H
         lOI7RYfSO6a6eussoYL+2ftd1O4l1Nh1jOG7Bb2VqPoWtC1QeYoxzuFg+rvRi7sM08Ny
         U0fQ==
In-Reply-To: <53553D20.5040401@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?U3ZlbiBLw7ZobGVy?= <sven.koehler@gmail.com>
Cc: netfilter@vger.kernel.org

Hello, Sven.

Seems like OK, but you should add
  iptables -t raw -A OUTPUT -j CT --notrack
to prevent of tracking of the local originated traffic.

2014-04-21 19:45 GMT+04:00 Sven K=C3=B6hler <sven.koehler@gmail.com>:
> Am 21.04.2014 17:56, schrieb Sven K=C3=B6hler:
>> I know have the following three rules:
>>
>> iptables -t raw -A PREROUTING -d <router-ip> -j CT
>> iptables -t raw -A PREROUTING -s <router-ip> -j CT
>> iptables -t raw -A PREROUTING -j CT --notrack
>
> Correction:
> iptables -t raw -A PREROUTING -d <router-ip1> -j CT
> iptables -t raw -A PREROUTING -d <router-ip2> -j CT
> iptables -t raw -A PREROUTING -j CT --notrack
> (again no rules in the OUTPUT chain of the raw table)



--=20
Anton.
