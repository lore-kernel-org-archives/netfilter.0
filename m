From: tom <tom@t0mb.net>
Subject: Re: will --cmd-owner ever return?
Date: Tue, 27 Mar 2007 20:25:34 +0100
Message-ID: <46096FAE.6060202@t0mb.net>
References: <20070327184526.GA5168@trane.vulkor.net>
	<460967CB.7020608@shorewall.net>
Reply-To: tom@t0mb.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <460967CB.7020608@shorewall.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@lists.netfilter.org, vwf <vwf@vulkor.net>

If a connection is established, then you can find the owner by comparing 
the inode in /proc/net/tcp with the /proc/<PID> tree [all the numbered 
folders].  In each of these there is a folder named fd which provides 
symbolic links to the open file descriptors which that PID is using.  a 
quick ls -l will give you the information you need to resolve it to a 
socket inode, you'll usually see socket:[32424] or something similar.  
You then know which PID owns the conection.  I have some python code 
which resolves this all to program names if you want it?

Tom Eastep wrote:
> vwf wrote:
>
>   
>> How can I lock my workstation down on application level?
>>     
>
> tuxguardian.sf.net
>
> -Tom
>   


