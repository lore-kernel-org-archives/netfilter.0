From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Packet disappears after DNAT?
Date: Sun, 6 Dec 2015 22:57:36 -0800
Message-ID: <CAKmUPx7uzn6jVSb-mLQOFCVXujBuabg-tTFiO6FOPKNZvi1WKg@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<CAEzD07JQmLe_SetqcEg-EetvD=Et=2Zy47V53nA37q75FBv_NA@mail.gmail.com>
	<CAKmUPx7x2EP_O26K8UC4SKQqPC11uM2sNSpNPSV3=jbqq4GdyQ@mail.gmail.com>
	<CAEzD07KT9ivvqA-1K_1C8PoyiaX1i6jLsQBh2ipnfvqcHv1qCA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=wURGqg7t82LbMUVZD/wEbPAprG2UKgPip+xQ+Gf6BgU=;
        b=2RMW/mT6jsRIqR8sOlwp0CTnOYrxEBYE+T5vgpx5FU6uHxl9WnxfbAVJ2pQkXWXnr9
         4ZyszLtf0yT1mkj1XR6D/SZCp0YC5pJ73eD8WHSQA06pnZ9yFzW2y7AnDBU/l8ueXqWR
         do2807fRogqiBYdL16LBz5Q31fc/kbnrrJma+epkuZdpSPoW05Fiyw6gAAZqZhP43Wrx
         VzAvYyvyH3o+CLCvf3/J/G4RHFLdrx/TwoLK2ydgM3GIcsNfqIZKMcUDMRkD/lsLMJqh
         FYWgiZrHaEM4hEJsZEv6FhzDIGIrIV0COXSXuZWS+MBTEZT6Xcq8DPMKXKVsf7EqgQ7n
         70SQ==
In-Reply-To: <CAEzD07KT9ivvqA-1K_1C8PoyiaX1i6jLsQBh2ipnfvqcHv1qCA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Dec 6, 2015 at 12:49 AM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
> show the output of 'ip route get 192.168.122.10 from 192.168.122.10
> iif virbr0' command

[root@ex ~]# ip route get 192.168.122.10 from 192.168.122.10 iif virbr0
192.168.122.10 from 192.168.122.10 dev virbr0
    cache <redirect>  iif *
