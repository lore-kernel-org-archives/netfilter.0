From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Filter source IP with UDP/514 destination port and change to
 UDP/9000
Date: Thu, 2 Jul 2020 18:00:20 +0200
Message-ID: <787848b8-10da-17b3-3272-4a13316ad117@tana.it>
References: <CAG2Qp6tcb1Ak=0utrF54bLLc5UEqFHWu1WhD9CH3KE3JAG-Q6w@mail.gmail.com>
 <CAG2Qp6uj10nb0tFcQBTGKJ5KcNhwJwJsRK3UKyceb0=WEF+nRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1593705620; bh=+bXM7weWLpQfwv8bR6lGeQkKL4zsZLLbrXM4wrovQjU=;
        l=1174; h=To:References:From:Date:In-Reply-To;
        b=AXq73zLCa4qnkCX3aBy+e5ZJDW9RdjpQUaNSpLOR61VdVOmQqooL7ZZfjZhoC6TIS
         rYYMsR/ce0Fhipofw4ZFUElNw6UEoacGhLb2pdQvkCLE3ooF1xZg2KZBPXl4jchdR8
         Ny1rBFZhRxnQylpmHvwErMm9GcMDdcOuhvke4PqKiNxEfHiN4hIBiKMdkfVkt
In-Reply-To: <CAG2Qp6uj10nb0tFcQBTGKJ5KcNhwJwJsRK3UKyceb0=WEF+nRg@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Roberto Carna <robertocarna36@gmail.com>, netfilter@vger.kernel.org

On Wed 01/Jul/2020 20:11:38 +0200 Roberto Carna wrote:
> Hi people, I have a log server with iptables, the IP is 10.10.100.1.
> 
> I have several network devices sending logs to my log server
> 10.10.100.1 on UDP/514 port.
> 
> In the log server,  I wanna filter incoming traffic only  from IP
> 10.10.100.20 to UDP/514 destination port and change to UDP/9000
> destination port.
> 
> How are the iptables rules to achieve what I said?


I have this stuff on "man iptables-extensions":

   REDIRECT
        This target is only valid in the nat table, in the  PREROUT‐
        ING  and  OUTPUT  chains,  and user-defined chains which are
        only called from those chains.  It redirects the  packet  to
        the  machine  itself  by  changing the destination IP to the
        primary address of the incoming interface (locally-generated
        packets  are  mapped to the localhost address, 127.0.0.1 for
        IPv4 and ::1 for IPv6).

        --to-ports port[-port]
               This specifies a destination port or range  of  ports
               to  use:  without this, the destination port is never
               altered.  This is only valid if the rule also  speci‐
               fies  one  of the following protocols: tcp, udp, dccp
               or sctp.


hth
Ale
-- 























