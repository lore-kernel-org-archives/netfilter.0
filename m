From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Support for String Match Blocking in NFTables
Date: Sat, 18 Jun 2022 11:29:11 +1000
Message-ID: <Yq0qZwKKsWziXJda@slk15.local.net>
References: <CANKwiJVSW3RjhHDnziGjWenApAcvdSAqBTi7MfHqyiyHd4_F=A@mail.gmail.com>
 <20220616202014.e7ebc6df8f8f0f1fdce27e12@plushkava.net>
 <CANKwiJX5_67uPPqdwoH3-gbY11Dmj29Hjse+8m3-bsJD0hHVEg@mail.gmail.com>
 <Yq0mDdXioEEC10KN@slk15.local.net>
Reply-To: duncan_roe@optusnet.com.au
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:date:to:subject:message-id:reply-to:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=nQudMtFlx8pRbwNTA0WxAt/gguZbNmqcRx5kLIU4k9g=;
        b=G0pcibkMWmPwA9W6gf0Js6iey9EZHPoRReizTSoua3qt2IdhKpgbQBe0rlYg1oGX2o
         c2X48u4bsgOjKmmh4nIhSh0ixGs8MoNTmqMIP1fAki3PI5qqA1xfcg7WZQ9x047YEThg
         QHA8dndYcGKFObth/YkTqmv09FxjA4h7qRkOCZcpi+yHaSwl3Icy5Q2Q9rXFYfnBhkRe
         rPSUUmtK893G4C7d9s6a4bib1YQ/58tMWpyrGwBjZgikCP34mrwGgTkkqjHjYX3PZvWL
         YcUG6nmkxsxi24Tho6YhFmA6cGcXDMxlYpnNLvHYlO573AWUHe6uLM7RLuFMdT3vJxlw
         2aBQ==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <Yq0mDdXioEEC10KN@slk15.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@vger.kernel.org>

On Fri, Jun 17, 2022 at 05:14:53PM +0100, Gmail Support wrote:
> Okay thank you, is there any plans to support this extension in the future?
>
> On Thu, Jun 16, 2022 at 8:20 PM Kerin Millar <kfm@plushkava.net> wrote:
> >
> > On Thu, 16 Jun 2022 10:15:55 +0100
> > Gmail Support <testingforadept@gmail.com> wrote:
> >
> > > Hello,
> > >
> > > We recently migrated our servers from RedHat to Ubuntu based systems.
> > > We used to have an IPtables rule that was blocking packets matching a
> > > specific application file and below was the rule we had deployed.
> > >
> > > -A INPUT -p udp -m udp --dport 514 -m string --string
> > > "someapplication.exe" --algo bm -j DROP
> > >
> > > In NFtables, I read in the blogs that string based blocking is not
> > > possible. In the man page of Ubuntu, I see a note "The  string  type
> > > is  used  to  for character strings. A string begins with an
> > > alphabetic character (a-zA-Z) followed by zero or more alphanumeric
> > > characters or the  characters  /, -, _ and .. In addition anything
> > > enclosed in double quotes (") is recognized as a string."
> > >
> > > Can you please confirm if string based blocking is supported in Nftables.
> >
> > There is no equivalent to the string extension in nftables. While it
> > is possible to match against a portion of the packet's payload using a
> > raw payload expression, doing so requires that the offset and length
> > of the data be specified. That is, it cannot search for a pattern and,
> > thus, match at any potential offset.
> >
> > --
> > Kerin Millar

You can do string matching by writing a libnetfilter_queue program.

Follow the documentation at
https://netfilter.org/projects/libnetfilter_queue/doxygen/html/

There are 2 sets of functions: the "deprecated" functions will run faster with
your requirements. They're not deprecated at all, only the underlying library
used by the current implementation is deprecated.

Cheers ... Duncan.
