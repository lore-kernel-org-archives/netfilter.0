From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: streaming problem
Date: Wed, 11 Sep 2002 12:59:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111159.g8BBxIv08420@vulcan.rissington.net>
References: <1031698631.3224.7.camel@skuda.betanetgeb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031698631.3224.7.camel@skuda.betanetgeb.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 10 September 2002 11:24 pm, skuda wrote:

> hi all :), i have a problem, i have 2 servers, with linux and apache
> 1.3.26 in it, one (A) have a slow connection 64kbit isdn, and the other
> (B) have a fast connection 100mbit, in A i have motion
> (http://motion.technolust.cx/)sharing a webcam in port 8001 and a java
> applet (cambozola) to show in the index of the webserver the camera in
> real time, i would like connect the fast (B) to the slow connection (A)
> and share with many people this camera without open more than one
> connection from (B) to (A), because  bandwith is too little to open many
> connections with B. Do you know any solution to this problem? thanks in
> advance

My only thought is to run Apache and the Java application on machine B, 
telling it to get its data source from A.   Then you will get multiple 
connections from people to the Java application but only a single feed from 
the video source to machine B.

This is assuming, of course, that the Java application is intelligent enough 
to serve multiple demands from a single data source.   If that's not the case 
then you'd have to look into some sort of video client/server arrangement 
between A & B so that B can act as the source of the data for the Java 
application...

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

