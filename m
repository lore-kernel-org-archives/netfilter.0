From: Thanasis <thanasis@asyr.hopto.org>
Subject: Re: traffic shaping between two LANs and one ppp0 default gw
Date: Sat, 12 Jun 2010 18:15:09 +0300
Message-ID: <4C13A47D.30905@asyr.hopto.org>
References: <4C104BDB.7060706@asyr.hopto.org> <4C139B8A.9030608@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C139B8A.9030608@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

on 06/12/2010 05:36 PM Michele Petrazzo - Unipex wrote the following:
> tc + htb | cbq | another handful of queues are what you are looking
> for and google for that (also for larc)
> P.s. As said in all the howtos that you can find, you can limit *only*
> upload speed (unless you use some trick and imq), so in you environment
> will be near impossible to split the download speed between the
> different lans since every queue are strictly linked with a interface,
> which cannot know each other
Thanks !
I read that imq is being replaced by ifb :
(already in kernel: Device drivers -> Network device support ->
Intermediate Functional Block support ).
http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb
