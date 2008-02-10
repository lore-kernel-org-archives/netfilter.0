From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: Session tracking failure - ssh packets dropped as INVALID
Date: Sun, 10 Feb 2008 09:35:51 +0200
Message-ID: <47AEA957.2030707@caf.com.tr>
References: <691DA14F-3FD0-4E19-A61C-74F34E095E49@uq.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=caf.com.tr;
	s=originating; t=1202628958; bh=oY3vBIDoUwYwqGlMIz3V0QDDCIXfyku54uN
	zdmRbkdU=; h=X-Virus-Scanned:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:Subject:References:In-Reply-To:X-Enigmail-Version:
	 Content-Type:Content-Transfer-Encoding; b=VWn6CO9qMEuuhrNBlgoEzjq+
	WyzpyhXwz8f/XHplJYHV1PyH4VBCZaJL0Zw47ejMBlOfQCl1lgn0FVTYFASfyFAM/rZ
	/7kKF5DxRTiAVE6mrbmdV9c+cdipi3bog6RFv6mOjWlkFyS2ajvaHGujcLUEYFQPdty
	UQWTK5kPC1QHs=
In-Reply-To: <691DA14F-3FD0-4E19-A61C-74F34E095E49@uq.edu.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 10.02.2008 05:29, John Zornig wrote:
> I can connect via ssh, but often when I generate a lot of traffic e.g. 
> by cat'ing a large file or running top, the session hangs. By selective 
> logging, I have discovered that when a session hangs the packets coming 
> to port 22 for that session change from ESTABLISHED to INVALID and I 
> have a rule that all INVALID packets are dropped. For some reason the 
> connection tracking appears to be faulty. Is this a known issue or am I 
> doing something incorrect? I've had this occur on a number of systems 
> I'm setting up at the moment all are configured similarly.

No word of advice unfortunately but I have bitten by packets getting 
dropped by the INVALID rule as well.  In the end, I have disabled the 
rule that drops INVALID packets.

On 15.11.2007 Jozsef Kadlezsic wrote to a similar question:

> Please enable full internal logging in netfilter and make sure at least 
> one loggin target module is loaded in and record by tcpdump one full 
> TCP session where such packets occurs. Then send me the generated kernel 
> log and the dump file so that I could analyze it. 

I did not have the time to debug it.  Maybe you can.  In addition, I 
have seen reports that increasing timeouts may help 
(ip_conntrack_tcp_timeout_close_wait, ip_conntrack_tcp_timeout_close, 
ip_conntrack_tcp_timeout_fin_wait, ip_conntrack_tcp_timeout_last_ack). 
It did not help for me and of course this is just a work around.  The 
real problem lies elsewhere.

-- 
Eray
