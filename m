From: Volkan YAZICI <yazicivo@ttmail.com>
Subject: Re: Traffic Mirroring for Debugging
Date: Sat, 23 Aug 2008 09:36:21 +0300
Message-ID: <87wsi89r16.fsf@alamut.mobiliz.com.tr>
References: <87vdxtwkh2.fsf@alamut.mobiliz.com.tr>
	<48AF7DFE.1020306@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48AF7DFE.1020306@riverviewtech.net> (Grant Taylor's message of
	"Fri, 22 Aug 2008 22:03:26 -0500")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@vger.kernel.org

On Fri, 22 Aug 2008, Grant Taylor <gtaylor@riverviewtech.net> writes:
> It won't help with the packet duplication, but I think it is related.  I think
> you will need to SNAT the traffic as it leaves 1.10 so that 1.2 / 1.20 will
> reply back to 1.10 rather than directly back to the client.  I think that 1.2 /
> 1.20 is replying directly back to the client and the client is going WTF???  Why
> is 1.2 / 1.20 replying to me?  I have not started a connection with
> them.

In the actual setup, original packets are received from a mobile device
through a VPN gateway. Therefore, endpoint server replies back to this
client, instead of the gateway packages received from.

> As far as packet duplication, I'd start with ulogd or something like
> that.  I'm betting you are going to have to pass the packets to user
> space for the duplication.

I'll check out ulogd. Thanks.


Regards.
