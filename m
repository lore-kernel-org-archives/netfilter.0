From: Susan Hinrichs <shinrich@thought-mesh.net>
Subject: Re: Select chain from set?
Date: Tue, 28 Apr 2009 10:39:00 -0500
Message-ID: <1240933140.12894.366.camel@chichi>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
Reply-To: shinrich@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240925694.4256.32.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: casper@meteor.dp.ua
Cc: Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

I also agree that a runtime structure to track traffic attributes and
match them to targets would be great.  I created my own match-tree table
generator to achieve a similar effect.  It works, but updating large
static structures can be rather time consuming and fragile.

I have a question about the '-g' terminology used by Casper and Oscar.
Is this a new piece of functionality?  Or are you talking about the
--goto option?

Susan

> > This all begs the question on how effective some tree structure with -g
> > is implemented, to figure out how much of a performance benefit such a
> > new target would have over a treelike chain structure.  
> 
> If we compare many linear -g with just one function gettarget(ip) the
> different is many/one. Tree-like -g structure would save most
> comparitions, but is hard to write for every task. Function-like target
> is real fast and fully automatic, the only disadvantage is in fact it
> doesn't exist :)
> 


