From: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 19:04:38 +0100
Message-ID: <X8fXNs9Qt6XfwqlA@flatwhite>
References: <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
 <X8d5JZT5cmBFUvNA@flatwhite>
 <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
 <X8eKYjtPSINtYYnl@flatwhite>
 <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
 <X8e8+YL653hAkGe9@flatwhite>
 <004f01d6c8d1$7c068350$741389f0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <004f01d6c8d1$7c068350$741389f0$@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

On Wed, Dec 02, 2020 at 07:35:07PM +0200, Eliezer Croitor wrote:
> There is a difference between packets which are dropped to the nic itself
> and traffic which is bounded to a specific ip address.
> From what I remember( and my memory is not the best as it was..) the last
> time I checked on Debian jessie you couldn't do any routing
> decision on a bounded socket.
> Maybe on newer versions of the kernel or another OS it's not the same.

But remember that `ip rule dport…` works (available in Buster) and it
interacts with the same sockets as fwmark does but `ip rule fwmark…`
doesn't work. So evidence suggest that there are indeed routing
decisions being made for those sockets.

Also note that I have done tests on sockets with sendto() without
explicit binding with any address or interface.

-- 
Marcin Szewczyk
http://wodny.org
