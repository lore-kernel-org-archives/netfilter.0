From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: smtp
Date: Fri, 14 May 2004 21:26:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405142126.29015.gdh@acentral.co.uk>
References: <BAY15-F33V6uPDVniSn0005fa4b@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F33V6uPDVniSn0005fa4b@hotmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 14 May 2004 21:11, azeem ahmad wrote:
> thanks a lot for solving this problem
> but here just tell me one thing more that how u said that i m safe. is
> there tcpdump output telling something. if yes then how u judge it.

I'm repeating myself here :) It's obvious because only one direction is 
logged. 

Try doing 'tcpdump -n port 80' for example, and you will see both sides of the 
TCP conversation, and compare that with the 'port 25'.

Cheers,
Gavin

