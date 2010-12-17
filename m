From: Reuben Martin <reuben.m@gmail.com>
Subject: Re: NAT with forwarding to multiple destinations
Date: Thu, 16 Dec 2010 23:47:13 -0600
Message-ID: <201012162347.13856.reuben.m@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :message-id;
        bh=3Kfkp5BsFGtzs5t+KOeHsp8mz4sQ0DEUB4j9sguX7RY=;
        b=xYJgMqn78gBbuO266JumOoUCV/kDQ+IEqtiUFTmv+vWu9pvGnE2ikVMbaTg9WuJVIP
         VLUPXjCx0qK7n+M9d+EuYWN5Im+4LVBnL4pDTXQQLo7AQGvx9VC3DWBR1S3RdidGGz87
         hq3ok7RToy/DkRMLoY0tMQ/WfP3nWlilqbSXw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org


I appoligize that this reply will probably not thread correctly, I just joined this list because I'm also looking for something like this. So I'm just pasting this from the web archive...

On Friday 2010-12-03 15:28:52, Jan Engelhardt wrote:
>On Thursday 2010-12-02 16:17, Alberto Quattrini Li wrote:
>
>>> The multiplexing you want is probably best done with a program that does
>>> just that - think of sprucing up rinetd.
>>
>>As far as I know, all of the programs like that are programs that run
>>as a process in the middle, so it introduces an overhead (because they
>>are in userspace and have to receive the packet and then process it
>>and finally forward it), whereas if it was processed by netfilter it
>>would be quicker and more efficient (actually some testing and
>>comparisons should be done, but in principle it ought to be so).
>>
>>However it seems that there doesn't exist any solution in netfilter.
>>Can you give me a reference (e.g. documentation and guides) to patch
>>netfilter with such functionality?

I'm looking for something like this as well. Specifically I need to be able to create a rule that will take packets sent to a given specified address & port and forward them to either an ip range or and ipset. An ipset is preferred because that way the destinations can be dynamically changed. I've tried several reflectors/forwarders and they generally suck. Futhermore none of them are dynamic (that I have found at least) And of course this limiting something like this to datagram packets would probably be a smart precaution.

Has anybody come up with something for this? I'm nowhere near competent enough to tackle something like this on my own. I'm a lousy hack. Basically my need for this is to be able to send a live rtp video stream to a dynamically changing group of unicast destinations. But changing destinations means stopping and restarting the stream. Doing this outside the streaming app gets around this. Multicasting is of course a great solution, but I have to hook into other peoples networks where I have no control over rules and layout, and there is rarely multicast support. And even where there is multicast support, I sometimes have to send through VPNs or subnet gateways where the multicast wouldn't reach anyway.


>
>You could write your own extension, based upon xt_TEE.
