From: Martijn Lievaart <m@rtij.nl>
Subject: Re: ftp access problem
Date: Sat, 24 Jul 2004 14:01:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41024F9E.1060905@rtij.nl>
References: <a0f69e504072403057b210342@mail.gmail.com> <200407241122.16298.Antony@Soft-Solutions.co.uk> <a0f69e5040724044591804e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e5040724044591804e0@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org

Askar Ali Khan wrote:

>Hi Anthony,
> 
>On Sat, 24 Jul 2004 11:22:16 +0100, Antony Stone
><antony@soft-solutions.co.uk> wrote:
>  
>
>>On Saturday 24 July 2004 11:05 am, Askar Ali Khan wrote:
>>
>>    
>>
>>>Hi
>>>
>>>On my router/firewall which acting i am getting problem while anyone
>>>tries to connect to ftp server he connected successfully however when
>>>he types and command for example "ls" ftp server return error "500
>>>Illegal PORT range rejected"
>>>Everything else is working fine.
>>>      
>>>
>>I see you are doing NAT on this firewall.   Do you have the nat_ftp support
>>module loaded or compiled in to your kernel?
>>
>>Without that module, netfilter will not see the PORT commands in the FTP
>>packets, and will not know what to do with the data connection on port 20
>>associated with the control connection onn port 21.
>>    
>>
>#modprobe nat_ftp
>   modprobe: Can't locate module nat_ftp
>  
>

Try ip_nat_ftp instead. Also, don't bother with port 20. Use a RELATED 
rule to let in the data connections. All this is documented in lots of 
howto's, www.netfilter.org is a good place to start.

HTH,
M4




