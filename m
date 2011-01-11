From: John Haxby <john.haxby@oracle.com>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 17:21:33 +0000
Message-ID: <4D2C919D.5040402@oracle.com>
References: <4D2B44E9.3000006@abpni.co.uk> <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com> <4D2B84F0.6030300@abpni.co.uk> <4D2C3426.3000202@oracle.com> <4D2C37A1.8090906@abpni.co.uk> <4D2C47DB.10702@oracle.com> <4D2C4C13.3020107@abpni.co.uk> <4D2C5193.6010703@oracle.com> <4D2C5285.9070108@abpni.co.uk> <4D2C8F7D.1080200@oracle.com> <4D2C9046.9070408@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C9046.9070408@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On 11/01/11 17:15, Jonathan Tripathy wrote:
> Just one last question. Are there any measures I would need to take to 
> make sure that traffic cannot escape from a Linux bridge? My bridges 
> don't have IP assigned to them and the VM hosts don't do IP routing. 

The only way to get from one bridge to another is by routing so if there 
is no route then there's no way to get packets (or frames) to leap from 
one bridge to another.  (And if you're using separate vlans then you'd 
need a machine on both that is prepared to route the packets.)

Of course, testing is paramount.  No amount of hypothesising is going to 
help if you haven't tested.

jch
