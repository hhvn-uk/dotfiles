geo(){
	curl -s https://ipinfo.io/$1/json | jq .ip,.city,.region,.country | tr '\n' '\,' | tr -d '\"' | sed 's/,/, /g'
}
