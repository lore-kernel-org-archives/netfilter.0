From: Bjoern Weiland <bjoern.weiland@rz.uni-karlsruhe.de>
Subject: Cloning Traffic had having it processed by two different hosts -
 TEE
Date: Wed, 23 Apr 2008 14:24:54 +0200
Message-ID: <480F2A96.3020603@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hey list,

here's what I need to do:
Our central routers all export cisco netflow data. This data is being 
sent to HOST A where it is processed. Now for some researching, I also 
need this data on HOST B for another kind of processing. So what I want 
to do is to clone the traffic arriving at HOST A. One copy should be 
processed by HOST A as usual and the copy needs to be sent to HOST B. As 
we do not only want to passively monitor this traffic, but really work 
with it, the copied traffic also needs to be rewritten with HOST B's IP 
address in the netflow data's Headers.

No here's the question: How do I best do this? I read and tried to work 
with the tee target of patch-o-matic-ng's extra repository, but 
apparently it is not working any longer on recent kernels.
Also I do have massive problems getting xtables-addons to compile on my 
Debian (I actually tried more than one machine and different gcc's and 
kernels) and there seems to be no documentation or mailinglist. Has 
anyone tried xtables-addons at Debian? If yes, which gcc, kernel, 
xtables version?

Now I am wondering, if my undertaking is realizable and how it can be 
done most efficiently... I am open for any hints, maybe there are some 
other solutions as well...

  -best regards, bjoern
