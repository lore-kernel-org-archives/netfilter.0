From: Samit Pal <samit04@gmail.com>
Subject: Question abt iptables nth module
Date: Sun, 5 Jul 2009 12:52:31 +0530
Message-ID: <1750ad3f0907050022h33cf02b2g76724152d8863a3f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=Cplmskf5nziCoM6lZputhMLdoJedcauJtvykl00prJY=;
        b=iZRUEYu6Qdq25KNPmIWWdgN9ZyKCmN+KxPjSb/lOS7rqoEJSeCswBO4VpkXxUq9BBM
         rLElk1f1N9UgwAK4taFEpz244U+rVgoOSbe+b/enh7ErNv3oXlAWWT42XUHW0iT8WVZJ
         uOjPus0wQTnD3tofvthm1O8kqtrnIW9Oo6drk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Folks,

I am using iptables nth module with marking and have configured a poor
man's load balancer. My set up is like the following. I have a proxy
http server on a machine which should connect to several back end
machines. By using nth module and marking i have configured a load
balancer. It sends every new connections in a round robin method. What
is want is to create ip table rules such that it sends the first say
1000 new connections to the first backend, the next 1000 new
connections to the 2nd backend and so on and so forth. Is there a way
to do this with nth module or any other way with iptables?

Also note that application level proxy pass load balancers like
apache,nginx are not an option here because my proxy actually does do
do http with the backends.

Thanks
Samit
