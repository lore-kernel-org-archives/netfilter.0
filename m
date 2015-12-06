From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Packet disappears after DNAT?
Date: Sun, 6 Dec 2015 11:49:11 +0300
Message-ID: <CAEzD07KT9ivvqA-1K_1C8PoyiaX1i6jLsQBh2ipnfvqcHv1qCA@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<CAEzD07JQmLe_SetqcEg-EetvD=Et=2Zy47V53nA37q75FBv_NA@mail.gmail.com>
	<CAKmUPx7x2EP_O26K8UC4SKQqPC11uM2sNSpNPSV3=jbqq4GdyQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=2vYuHnXumwJ7esSEKoR7X7vKGryothWDZwkaUbGA1Us=;
        b=QkdjxDrLldG8kpWfZFSaOs6h5/u0DbhXkDJX3eOrXZ9zaB38Mfl3oAxpN8iQq425lE
         oj7ubF8MN1BgnAMqT3eScvZmFFMxzbKvbsQ0LQqX3EhU/DSyHZhpycPr0Zjc49e4RT0e
         I2Mdb1q2QgoNNJO4JbtMhe8O7dmIbIGDJ+u736UVpl9rKl7/pR8Tx/8ZdN943Zdnbf+d
         8PSce2/uQKXO7bzwzr7QYGAMvW2pnfLYSXWaKQ1hlyfmR9cGkxdT0sq6AiwSek+vdHOb
         9+IV88eH05rCS4i/woWJz2qjSXUSfI2ZX+dbECfhJvPPpQ8iMwumthHWRP7KzS9vJxrB
         7EkA==
In-Reply-To: <CAKmUPx7x2EP_O26K8UC4SKQqPC11uM2sNSpNPSV3=jbqq4GdyQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org

show the output of 'ip route get 192.168.122.10 from 192.168.122.10
iif virbr0' command

2015-12-04 19:18 GMT+03:00 Scott Bronson <bronson@rinspin.com>:
> On Fri, Dec 4, 2015 at 3:55 AM, Anton Danilov
> <littlesmilingcloud@gmail.com> wrote:
>> Have you enabled the ip forward?
>
> Yep, alas.  Connections from the host and the public IP work great.
> It's just connections from the VM where the packet disappears.
>
>
> I also should have mentioned that this is on Centos 7, and:
>
> [root@ex ~]# cat /proc/version
> Linux version 3.10.0-229.20.1.el7.x86_64
> (builder@kbuilder.dev.centos.org) (gcc version 4.8.3 20140911 (Red Hat
> 4.8.3-9) (GCC) ) #1 SMP Tue Nov 3 19:10:07 UTC 2015
>
> [root@ex ~]# iptables --version
> iptables v1.4.21



-- 
Anton.
