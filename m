From: Oscar N <oscar@kiruna.se>
Subject: Re: [Ebtables-user] Log VLANs without interfaces.
Date: Mon, 15 Nov 2010 14:36:45 +0100
Message-ID: <8d96ecb4677f1ab6e0e43aaf626336d1@localhost>
References: <7B021863-0FB7-4199-A855-1B2A57950652@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7B021863-0FB7-4199-A855-1B2A57950652@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

We did this a couple of years ago due to shitty switches that didn't even
had the possibility to filter out packets from rouge DHCP servers.
What we did was using a central database and scripts on the linux boxes
instead that handled all the hard work of setting up/removing interfaces.
Worked very well and we also incorporated multiple routing tables and per
user packet shaping. Maybe that would be another approach to solve the
problem.

/Regards Oscar

On Mon, 15 Nov 2010 10:47:31 +0000, Asher Awelan <asherawelan@gmail.com>
wrote:
> SCENARIO:
> I have inherited a hospitality solution which uses 802.11q tagging on
it's
> switched network for the purpose of room identification, i.e. one port
per
> room.
> My current handling of this is working but not stable and is memory
heavy.
> Currently I have the 250 (I know!) VLANs on eth1.x as interfaces and
have
> bridged them on br0.
> I am using ebtables to log which mac addresses are using which vlan tag
> and then doing some cron processing to charge data use to the rooms.
> However, this is pretty intensive on the network/ifconfig management.
> 
> QUESTION:
> Is there a way to broute the vlans to the eth1 interface and not have to
> create every interface and register every vlan... or perhaps strip the
vlan
> id (after logging of course)...
> 
> Further clarification can be given of course.
> I know this is a ridiculous scenario, however these are my parameters
> within which to work.
> 
> Thank you kindly,
>
------------------------------------------------------------------------------
> Centralized Desktop Delivery: Dell and VMware Reference Architecture
> Simplifying enterprise desktop deployment and management using
> Dell EqualLogic storage and VMware View: A highly scalable, end-to-end
> client virtualization framework. Read more!
> http://p.sf.net/sfu/dell-eql-dev2dev
> _______________________________________________
> Ebtables-user mailing list
> Ebtables-user@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/ebtables-user
