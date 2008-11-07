From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: filtering packet within a L2 brige
Date: Fri, 07 Nov 2008 09:15:31 -0600
Message-ID: <49145B93.1020201@riverviewtech.net>
References: <e07111640811061404n7393b58o5a1fa0459e26a142@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e07111640811061404n7393b58o5a1fa0459e26a142@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/06/08 16:04, Amine KERKENI wrote:
> I want to write some code to simulate network disturbance ( some 
> weired failure law ) with a Linux box playing the role of a network 
> L2 bridge.  However, I don't know if this job can be done using 
> netfilter.

Ok...

Are you wanting to simulate he failure in EBTables or a failure 
elsewhere in the network that just happens to be passing through an 
EBTables bridge?

If you are wanting to do the latter, take a look at the network testing 
code under the QoS tree in the kernel.  I've never messed with it, but 
it is probably fairly easy to extend and make it do what you want to.



Grant. . . .
