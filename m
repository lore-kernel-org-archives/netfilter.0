From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Filtering module on OSI level 7?
Date: Fri, 2 May 2008 15:15:47 +0200
Message-ID: <200805021515.48361.ben@differentialschokolade.org>
References: <DBB76FAC-A063-498C-812B-B785C6C0C724@unifr.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DBB76FAC-A063-498C-812B-B785C6C0C724@unifr.ch>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday 02 May 2008 14:20:44 you wrote:
> I would nevertheless prefer something similar to LittleSnitch
> (http://www.obdev.at/products/littlesnitch/index.html) on OS X or to
> ZoneAlarm on Windows.

Why? Filtering traffic by application (which is different from filtering 
traffic based on the application layer) doesn't add anything to security. If 
you don't trust an application to behave correctly, you also cannot trust it 
not to use other applications via IPC to connect to the Internet.

The products you have named are nothing but snake oil.

Benedikt
