From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: active interface?
Date: Thu, 21 Aug 2008 09:27:27 -0500
Message-ID: <48AD7B4F.8090105@riverviewtech.net>
References: <200808151255.44987.janklodvan@gmail.com> <48A7A94E.8070202@reptiliannature.org> <48A7B09E.4040403@riverviewtech.net> <200808211632.37656.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808211632.37656.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/21/08 08:32, Jan Klod wrote:
> I have an unanswered question: how active interface is determined in 
> Linux? I mean, interface, which is used by web / mail / ping 
> (default) ?

It's not an ""interface per say.  To the best of my knowledge what 
happens is that your routing stack chooses the best route (gateway) to 
send your request through.  Once it has the route selected it will use 
the interface facing said route as it's source IP unless a specific 
source IP has already been chosen by the application.



Grant. . . .
