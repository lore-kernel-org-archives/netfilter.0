From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: iptables 1.2.8 libc6 question
Date: Tue, 15 Jul 2003 18:51:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F14AFBF.9020203@smgtec.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E359F@alderaan.smgtec.com> <200307160100.41284.emanuel@abc.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307160100.41284.emanuel@abc.at>
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
To: Emanoil Kotsev <emanuel@abc.at>
Cc: netfilter@lists.netfilter.org

Emanoil Kotsev wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>ThanX Daniel,
>unfortunately you are not telling me anything new.
>My question is how could I point iptables to the other libc.
>
>Few things are going trough my mind:
>
>1) exporting and mounting trough nfs on the compile-machine and then pointing 
>the compiler to the directory mounted.
>Question: after I install iptables where is it going to look for the 
>libraries?? I don't think it will find the proper path
>  
>
Libc == dynamic so ld.so.conf will show you the way.

>2) copying the libraries for ex. in /usr/local/lib
>Question: On target machine the libs are in /lib ??? would iptables find them 
>under /usr/local/lib (it is in ld.so.conf)
>  
>
yeah

>3) What about compiling iptables with no shared libraries as it will be 
>permanently used - are the libc6 -> libc-2.3.1 included in iptables?
>  
>
Should be, static binaries are pretty simple if space isn't a concern. 
Hell, with libc static in the binary, you don't even need to get the 
other libc for the build platform. Hmm..

>4) perhaps the easiest way if possible at all would be to upgrade the target 
>machine
>  
>
Also a good idea if an upgrader is easily found. Depends on how many 
programs are installed as well.

>Which should I choose and are there any better ideas???
>
>Thanks in advance for taking your time
>
>unfortunately I tried to replace libc-2.2.5 on the target machine but it 
>wasn't good idea :-)) I ran into "hella trouble".
>  
>
Definitly - Basically only upgrades from distributions are the only 
practical way to accomplish this in larger platforms.



