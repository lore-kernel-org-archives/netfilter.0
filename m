From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: Traffic Mirroring for Debugging
Date: Sat, 23 Aug 2008 10:10:22 +0300
Message-ID: <48AFB7DE.1050901@caf.com.tr>
References: <87vdxtwkh2.fsf@alamut.mobiliz.com.tr>	<48AF7DFE.1020306@riverviewtech.net> <87wsi89r16.fsf@alamut.mobiliz.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=caf.com.tr; h=
	content-transfer-encoding:content-type:in-reply-to:references
	:subject:mime-version:user-agent:from:date:message-id:received
	:received:x-virus-scanned; s=originating; t=1219475431; bh=ukEcq
	UMBzW5IbKZYAwmI+HLmM4kuOfg2lsTUmqeg7P0=; b=LwrGkDVtlWsV1xwKrZLU4
	eyDlpveX4CbmxIrDZ0WP63hZVwNjpr+NONa9Mz+3E3p0HJvP/B/oG2OlaCd/Btef
	aJ9LLYgpKxqzJUPTKM1egm2MkA+rGDgTBXoDew/dEPLmzmhKOO4ca/tMB9cgG7tJ
	J4JyphkfUf6ArnERV+45JA=
In-Reply-To: <87wsi89r16.fsf@alamut.mobiliz.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 23.08.2008 09:36, Volkan YAZICI wrote:
[...]
>> As far as packet duplication, I'd start with ulogd or something like
>> that.  I'm betting you are going to have to pass the packets to user
>> space for the duplication.
> 
> I'll check out ulogd. Thanks.

Also check the TEE target.  I am not sure what the current status is though:

http://www.gossamer-threads.com/lists/iptables/devel/68781
http://dev.computergmbh.de/files/xtables/

-- 
Eray
