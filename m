From: Patrick McHardy <kaber@trash.net>
Subject: Re: 64bit MARK
Date: Thu, 29 Oct 2009 23:33:53 +0100
Message-ID: <4AEA1851.80400@trash.net>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com> <1256848782.6547.74.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1256848782.6547.74.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: fdelawarde@wirelessmundi.com, netfilter@vger.kernel.org

John A. Sullivan III wrote:
> Just as an aside, we've had problems using the top 16 bits of the 32 bit
> marks.  The OpenSWAN implementation on SnapGear devices changes the top
> 16 bits all on its own with two separate bugs - one with compression
> enabled and another regardless of compression- John

You should talk to the *swan people, their kernel implementation
is seriously fscked.
