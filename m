From: Rodrigo Severo <rodrigo.lists@fabricadeideias.com>
Subject: Re: Error Patho-o-matic modules
Date: Sat, 13 Dec 2003 08:20:01 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDAE7D1.4000807@fabricadeideias.com>
References: <3FDAD52D.5090206@bonbon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FDAD52D.5090206@bonbon.net>
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
To: Joel <zealous@bonbon.net>
Cc: netfilter@lists.netfilter.org

Joel wrote:
> Dear all,
> 
> I want to install time modules from path-o-matic. I did all the things. 
> Now time experimental modules is patched in the kernel. I have selected 
> it as module (M). but when I am giving the command # make modules then 
> it is giving me error.
> below is the error:---
> has any one solved this type of problem.
> 
> any help will be greatly appreciated.
> Thanks
> 
> root@joel linux-2.4]# make modules

I usually do a "make dep clean bzImage modules..." after patching my 
kernel with patch-o-matic. Never had any problems like these.


Rodrigo Severo

