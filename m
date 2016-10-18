From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: iptables-translate command not found
Date: Tue, 18 Oct 2016 13:04:21 +0200
Message-ID: <CAOkSjBg0NbbF_AWdaXM05P3q0BZgH9nfo1GDpfPxTuEH5QjqWQ@mail.gmail.com>
References: <CAOCi2DEkJ3JOJdYUK4_jX3cfdP7Rwje7zioqLBaj5Um3HoiT8Q@mail.gmail.com>
 <20161014181808.GF6526@harrier.slackbuilds.org> <20161014221257.GG6526@harrier.slackbuilds.org>
 <20161017193243.GA24375@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161017193243.GA24375@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 17 October 2016 at 21:32, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> AFAIK iptables-translate is already included in the iptables 1.6.0
> release, right?

All the work Shivani did was after the 1.6.0 release.

The 1.6.0 tarball may include the main code of the iptables-translate
binary, but the translations itself are missing for most extensions.
