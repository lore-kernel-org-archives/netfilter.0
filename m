From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: No package signature check for specific repository
Date: Sat, 10 Dec 2005 19:47:47 +0200
Message-ID: <439B14C3.1050300@gmail.com>
References: <200512101355.46132.post@hendrik-sattler.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200512101355.46132.post@hendrik-sattler.de>
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
To: netfilter@lists.netfilter.org

Hendrik Sattler wrote:

>Georgi Alexandrov wrote:
>  
>
>>I'm using debian unstable and the main debian unstable repositories to
>>update my system.
>>I have added the ftp://ftp.nerim.net/debian-marillat/ repository to my
>>sources.list file.
>>Works great, but every time I deal with apt-get or aptitude I get
>>notified:
>>
>>"W: GPG error: ftp://ftp.nerim.net sid Release: The following signatures
>>couldn't be verified because the public key is not available: NO_PUBKEY
>>07DC563D1F41B907"
>>
>>I want to turn off gpg check fot that particular respository, is that
>>possible?
>>    
>>
>
>Why don't you just think about "because the public key is not available", get 
>that key and make it available?
>Read "man apt-key".
>
>HS
>
>  
>
nerim.net aren't signing their packages (yet?).
That's why I wanted to turn off gpg check for that specific repository.

