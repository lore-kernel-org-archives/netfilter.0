From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: "excessively large" library built in standalone ipset build
Date: Thu, 20 Nov 2008 15:43:04 -0800
Message-ID: <7259d7020811201543w3283fdd7red50d86788a0b730@mail.gmail.com>
References: <7259d7020811201429p2b83a4a5h88c46331cfbbf449@mail.gmail.com>
	 <alpine.LNX.1.10.0811202352550.25790@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=zjN8HVgmJgP3O0/JiCZev/R8QU+PKckVRzuMTfrZW4Q=;
        b=Swe3UQtRhcrt/kDQJrf/qR8WMbT0idQBoSxyiMQCPmMR5PthvJHpbFMULYNxIRmWcZ
         JRRGnnduK9pJB6YaN9mKr3GsiuLEumiX8hWvOnOh1bHPkWRj7PN/fkwoDFdwXLxt1wuu
         WTyKcPhLi4GNlBhiWo7Z8MyqmHgRTDYbFC/6o=
In-Reply-To: <alpine.LNX.1.10.0811202352550.25790@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Jan,

On Thu, Nov 20, 2008 at 2:56 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> I wonder. Can you give a dump of the following command?
>
>        readelf -S libipset_ipportnethash.so

(Adding yet another tool I need to learn about ...)

readelf -S libipset_ipportnethash.so
There are 34 section headers, starting at offset 0x202788:

Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
  [ 0]                   NULL             0000000000000000  00000000
       0000000000000000  0000000000000000           0     0     0
  [ 1] .hash             HASH             0000000000000190  00000190
       00000000000000c0  0000000000000004   A       3     0     8
  [ 2] .gnu.hash         GNU_HASH         0000000000000250  00000250
       000000000000003c  0000000000000000   A       3     0     8
  [ 3] .dynsym           DYNSYM           0000000000000290  00000290
       00000000000002b8  0000000000000018   A       4     2     8
  [ 4] .dynstr           STRTAB           0000000000000548  00000548
       0000000000000130  0000000000000000   A       0     0     1
  [ 5] .gnu.version      VERSYM           0000000000000678  00000678
       000000000000003a  0000000000000002   A       3     0     2
  [ 6] .gnu.version_r    VERNEED          00000000000006b8  000006b8
       0000000000000020  0000000000000000   A       4     1     8
  [ 7] .rela.dyn         RELA             00000000000006d8  000006d8
       0000000000000270  0000000000000018   A       3     0     8
  [ 8] .rela.plt         RELA             0000000000000948  00000948
       0000000000000180  0000000000000018   A       3    10     8
  [ 9] .init             PROGBITS         0000000000000ac8  00000ac8
       0000000000000018  0000000000000000  AX       0     0     4
  [10] .plt              PROGBITS         0000000000000ae0  00000ae0
       0000000000000110  0000000000000010  AX       0     0     4
  [11] .text             PROGBITS         0000000000000bf0  00000bf0
       0000000000000ad8  0000000000000000  AX       0     0     16
  [12] .fini             PROGBITS         00000000000016c8  000016c8
       000000000000000e  0000000000000000  AX       0     0     4
  [13] .rodata           PROGBITS         00000000000016d8  000016d8
       0000000000000414  0000000000000000   A       0     0     8
  [14] .eh_frame_hdr     PROGBITS         0000000000001aec  00001aec
       000000000000006c  0000000000000000   A       0     0     4
  [15] .eh_frame         PROGBITS         0000000000001b58  00001b58
       00000000000001b4  0000000000000000   A       0     0     8
  [16] .ctors            PROGBITS         0000000000201cf8  00201cf8
       0000000000000018  0000000000000000  WA       0     0     8
  [17] .dtors            PROGBITS         0000000000201d10  00201d10
       0000000000000010  0000000000000000  WA       0     0     8
  [18] .jcr              PROGBITS         0000000000201d20  00201d20
       0000000000000008  0000000000000000  WA       0     0     8
  [19] .data.rel.ro      PROGBITS         0000000000201d40  00201d40
       00000000000000e0  0000000000000000  WA       0     0     32
  [20] .dynamic          DYNAMIC          0000000000201e20  00201e20
       0000000000000190  0000000000000010  WA       4     0     8
  [21] .got              PROGBITS         0000000000201fb0  00201fb0
       0000000000000030  0000000000000008  WA       0     0     8
  [22] .got.plt          PROGBITS         0000000000201fe8  00201fe8
       0000000000000098  0000000000000008  WA       0     0     8
  [23] .data             PROGBITS         0000000000202080  00202080
       00000000000000f0  0000000000000000  WA       0     0     32
  [24] .bss              NOBITS           0000000000202170  00202170
       0000000000000028  0000000000000000  WA       0     0     16
  [25] .comment          PROGBITS         0000000000000000  00202170
       0000000000000190  0000000000000000           0     0     1
  [26] .debug_aranges    PROGBITS         0000000000000000  00202300
       0000000000000090  0000000000000000           0     0     16
  [27] .debug_info       PROGBITS         0000000000000000  00202390
       0000000000000100  0000000000000000           0     0     1
  [28] .debug_abbrev     PROGBITS         0000000000000000  00202490
       0000000000000024  0000000000000000           0     0     1
  [29] .debug_line       PROGBITS         0000000000000000  002024b4
       0000000000000110  0000000000000000           0     0     1
  [30] .debug_ranges     PROGBITS         0000000000000000  002025d0
       0000000000000090  0000000000000000           0     0     16
  [31] .shstrtab         STRTAB           0000000000000000  00202660
       0000000000000125  0000000000000000           0     0     1
  [32] .symtab           SYMTAB           0000000000000000  00203008
       00000000000008b8  0000000000000018          33    66     8
  [33] .strtab           STRTAB           0000000000000000  002038c0
       000000000000034c  0000000000000000           0     0     1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), x (unknown)
  O (extra OS processing required) o (OS specific), p (processor specific)

--JC
