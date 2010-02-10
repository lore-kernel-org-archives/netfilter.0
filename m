From: Gerardo Fernandez <gfhgfh@gmail.com>
Subject: Re: Who can give me any existing iptables rules for reference?
Date: Wed, 10 Feb 2010 22:23:45 +0100
Message-ID: <8ed551511002101323j54d05820g31fdd4908443fb91@mail.gmail.com>
References: <28efc0211002060450n782f9273i9489e289dbc62407@mail.gmail.com>
	 <4B719306.7080709@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=EZGO2xsDNvVrPQBwTJLYb98nADCZYS+Pip4xgfFaKTE=;
        b=gjz7yKDJ8t8M+GQynRfKdbrWucxPFUAs8EgspVf0kUSPmM08yFbP+ico0FtDArZHGg
         bRAZHn+8AGUY8McvXHyDbGT++ZKSa2JP6JRhPC6heegbIuAXBQZT0ZiWE04RlHSwybmH
         NgK+rLgdbd2w+kGAiShA7J7DEhGilw4i3DjWw=
In-Reply-To: <4B719306.7080709@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Feb 9, 2010 at 5:53 PM, Mart Frauenlob <mart.frauenlob@chello.at> wrote:
> On 06.02.2010 13:50, netfilter-owner@vger.kernel.org wrote:
>> Hi,i'm a rookie.As learning netfilter/iptables for the first time,i
>> wanna look some good existing iptables rules scripts as that i think
>> reading good rules scripts will be useful.
>
> you need to understand the concepts for writing good rule-sets.
> Example scripts of course will help to understand.
>
> Here's a tutorial (not 100% up to date) including sample scripts:
> http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html
>

Oskar Andreasson tutorial is a big source of information not only
about iptables, but also about TCP/IP. Too deep in my opinion for
students trying to learn the basics. Being a teacher but not an expert
in iptables, I use the following notes as an introductory tutorial to
Netfilter/iptables:

http://www.ajedrezvasco.com/infor/iptables_basics.htm

In a really simplified way, I try to make my students grasp the basics
ideas. Any feedback, correction, sugestion, etc, is welcome and will
be included when I teach it again in a month or so.

-- 
Saludos.
Gerardo Fernandez
http://www.ajedrezvasco.com
