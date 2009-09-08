From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: ulogd compile problems
Date: Tue, 08 Sep 2009 18:25:04 +0200
Message-ID: <4AA68560.1080006@unipex.it>
References: <4F548017-89C1-42AE-87F1-68F92C62A8D4@gmail.com> <22C0D408-B9FD-4B04-9CD8-E077E45C7F3A@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <22C0D408-B9FD-4B04-9CD8-E077E45C7F3A@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Frisvold <xenophage0@gmail.com>
Cc: netfilter@vger.kernel.org

Jason Frisvold wrote:
> On Sep 5, 2009, at 11:31 PM, Jason Frisvold wrote:
>> I'm having a problem compiling ulogd 1.24.  I believe I have all of
>>  the appropriate development libraries installed, but I'm receiving
>> the error below.  This is a CentOS 5.3 system with MySQL 5.0.67 
>> installed.  Can someone please shed some light on how to resolve
>> this?
> 
> Is this not the proper list to ask such questions?  If so, can
> someone please direct me to a more appropriate place?
> 


I think that it's the right one, but the developers can be busy sometime...

However, "ld: bad -rpath option " can be only a linker option so trying
to googleing a bit, I found this: http://tinyurl.com/nqewau

Modify the Makefile with that options and, if it work, try to submit a 
patch to the devels.

Michele
