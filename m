From: Born Without <blackhole@airpost.net>
Subject: Wrapper script for ipset listing
Date: Sat, 05 Jan 2013 17:05:50 +0100
Message-ID: <50E84F5E.8060704@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010904070704030704050306"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject
	:content-type; s=mesmtp; bh=2xOkvblj7+AfJM5cUMg5p7sYrp0=; b=qgtF
	tplgoX8LHUVvri5nPheiqMkioUn9cRPyc+1dJ3p2gv81ZZIjczgPN3DSzX7fVmsW
	e20MtSCUg2QuOeOX0oDYDLNJdZ4UpyaDbf39h0PJwB9qe6s30kpl7vmyxW4wsabR
	ZnrSfqhydiX1yIz+NdT2iFJL5WA7TyEy/cacclE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:content-type; s=smtpout; bh=2xOkvblj7+A
	fJM5cUMg5p7sYrp0=; b=NXnm64xxDAU6OS8R+c1/Ku1tBfXknTK72NKg4HAFXeF
	RWAQ0ckpJSYYMA+9rXUvt8G6JQA9eckcu/LziulbDkhK3Jju/iSJiQVnpF7zPjNk
	6xZUyTTQtAnvOKv2EdzyGy241t+j3/T/AUoq5w0xhMzxThlvLLzrousD1vrDV0cE
	=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010904070704030704050306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello list!

As I was missing those features in the ipset set listing capabilities:

- show sum of set members
- suppress listing of headers
- choose a delimiter character for separating member entries

I wrote a little wrapper script (for the bash shell) to support them.
For those who like, you'll find it attached.

Comments etc. welcome...

Best regards

--------------010904070704030704050306
Content-Type: text/plain; charset=windows-1252;
 name="ipset_list.bash"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ipset_list.bash"

#!/bin/bash

# -----------------------------------------------------------------
ipset="/sbin/ipset"
delim=" "
TMOUT=30
# -----------------------------------------------------------------

set -f
shopt -s extglob

show_count=0 show_members=0 headers_only=0 names_only=0 i=0

[[ -x $ipset ]] || {
	printf "ipset binary \`%s' does not exist, or is not executable" "$ipset"
	exit 1
}
while (($#)); do
	case "$1" in
		-h) printf "%s [-{c|h|m|n|r|s|t}] [...] [-d char] [set-name] [...]\n" "${0//*\//}"
			exit 0
		;;
		-c) show_count=1
			shift
		;;
		-m) show_members=1
			shift
		;;
		-n) names_only=1
			shift
		;;
		-t) headers_only=1
			shift
		;;
		-d) if [[ -z $2 ]]; then
				printf "delim character is missing\n" >&2
				exit 2
			else
				if ((${#2} > 1)); then
					printf "only one character is allowed as delim\n" >&2
					exit 2
				fi
				delim="$2"
				shift 2
			fi
		;;
		-s|-r) arr_par[i++]="$1"
			shift
		;;
		-o) if [[ $2 != plain ]]; then
				printf "only plain output is supported\n" >&2
				exit 2
			else
				shift 2
			fi
		;;
		-\!|-f) shift
		;;
		*) break
	esac
done
if ((names_only)); then
	if ((show_count || show_members)); then
		printf "options -n and -c|-m are mutually exclusive\n" >&2
		exit 2
	fi
	"$ipset" l -n
	exit $?
fi
if ((headers_only)); then
	if ((show_count || show_members)); then
		printf "options -t and -c|-m are mutually exclusive\n" >&2
		exit 2
	fi
	"$ipset" l -t
	exit $?
fi

i=0
if [[ $1 ]]; then
	arr_opts=("$@")
else
	while IFS=$'\n' read -r; do
		arr_opts[i++]="$REPLY"
	done < <("$ipset" l -n)
	i=0
fi

for x in "${!arr_opts[@]}"; do
	while read -r; do
		if [[ $REPLY = Name:* ]]; then i=0
			printf "\n%s\n" "$REPLY"
			continue
		elif [[ $REPLY = @(Type|Revision|Header|Size in memory|References|Members):* ]]; then
			continue
		elif [[ -z $REPLY ]]; then
			continue
		else
			if ((show_members)); then
				printf "%s$delim" "$REPLY"
			fi
			let i+=1
		fi
	done < <("$ipset" l "${arr_opts[x]}" "${arr_par[@]}")
	if ((show_members)); then
		printf "\n"
	fi
	if ((show_count && i)); then
		printf "Member count: %d\n" $i
	fi
done

--------------010904070704030704050306--
