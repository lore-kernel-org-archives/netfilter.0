From: Jonathan Knight <j.knight@kis.keele.ac.uk>
Subject: Re: Forwarding a TCP connection request
Date: Sun, 08 Feb 2009 22:17:17 +0000
Message-ID: <498F59ED.6050403@kis.keele.ac.uk>
References: <gmmdsv$rgq$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gmmdsv$rgq$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Ralf wrote:
> Is this possible to do:
> a TCP connection request to a specific port
> on this machine comes in. 


You can get a similar effect using the "redirect" feature of xinetd.  
The intermediate machine still has to relay the packets to and fro but 
it's transparent as long as the server doesn't do a getpeername() call.

You can stick an "only_from" parameter in as well to restrict who can 
connect to the port.

Jon
