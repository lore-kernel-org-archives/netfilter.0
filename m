From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: firewall machine eating lot of memory
Date: Thu, 08 Nov 2001 08:21:16 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c16871$64ede530$6601a8c0@s3ac>
References: <008e01c28732$dd9884f0$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <008e01c28732$dd9884f0$8c01a8c0@sundaram>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Sundaram Ramasamy' <sun@percipia.com>, netfilter@lists.netfilter.org

I'm noticing the same problem. I have a low usage firewall (3 concurrent
connections) with httpd, smb, and sshd. But my Memory usage is always
close to 59Megs of physical Ram. When I us ps to print my usage per
processs it only adds up to 50%. What is this follow script that you use
?


> Hi,
> 
> Ia m using  Rdhat 7.3  kernel 2.4.18-3custom for my firewall, 
> suddenly its taking lot of memory, after that its not 
> releasing. I ran the following script to monitor the memory usage.
> 
> Morning 3 to 4  its taking all the memory.
> 
> please help me on this.
> 
> Thanks
> 
> 
>


