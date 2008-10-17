From: Eric Leblond <eric@inl.fr>
Subject: Re: string
Date: Fri, 17 Oct 2008 17:08:35 +0200
Message-ID: <20081017150835.GB21398@khasse.inl.fr>
References: <38e492ee0810170730t1a330ec2td54f190dd5f66aed@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <38e492ee0810170730t1a330ec2td54f190dd5f66aed@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chima s <chima.s@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Friday, 2008 October 17 at 20:00:04 +0530, chima s wrote:
> Hi,
> 
> I want to deny brwsing the yahoo and if somebody try to access the any
> yahoo url, it will redirect to another page from my local web server.
> 
> I added the below rule
> 
> iptables -t nat -I PREROUTING -p tcp -m string --string "yahoo" --algo
> bm -j DNAT --to-destination xxx.xxx.xxx.xxx

NAT table is only reached for the SYN packet. Thus you can match of the
GET which come later.

You should use a proxy to do so.

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
